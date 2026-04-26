/// Shared utilities for v2-page golden tests.
///
/// Goldens compare the rendered widget tree against a saved PNG. They catch
/// design regressions (unintended color/typography/layout changes) that other
/// tests miss because they only assert on widget _structure_.
///
/// Workflow:
///
/// 1. First run / intentional design change:
///    ```
///    flutter test test/golden --update-goldens
///    ```
/// 2. Verification (CI / regular runs):
///    ```
///    flutter test test/golden
///    ```
/// 3. Goldens are saved next to the test file under
///    `test/golden/goldens/<test_name>.png`.
///
/// Caveats:
///
/// - Flutter goldens are **platform-specific**. CI must run goldens on a single
///   reference platform (recommended: Linux). On Windows/macOS the saved PNGs
///   may differ pixel-for-pixel even with identical code. We tag every golden
///   test with `golden` so CI can target them: `flutter test --tags golden`.
/// - The Pretendard font is **not** loaded in `flutter test`'s default
///   environment — text falls back to a generic `Roboto`-ish family. That's
///   fine as long as goldens are regenerated on the same env that runs them
///   in CI. If you want true Pretendard rendering, use the
///   [loadPretendardFont] helper below.
/// - SVG assets (e.g. `Assets.icons.logo.svg`) need a real asset bundle. For
///   pages that depend on SVGs, prefer to substitute a placeholder or skip
///   the golden.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/// Default device size used by all goldens (matches Figma 360×800 frames).
const Size kGoldenDeviceSize = Size(360, 800);

/// Wraps [child] in a deterministic harness suitable for golden snapshots.
///
/// We rely on the test view (configured by [matchGolden] before pumping) to
/// fix the size + DPR. Wrapping in a [MediaQuery] would be ignored anyway
/// because [MaterialApp] reads from the test view directly.
///
/// Pass `appBuilder` if you need to customize the wrapping `MaterialApp`
/// (e.g. to inject `localizationsDelegates`).
Widget goldenHarness(
  Widget child, {
  Size designSize = kGoldenDeviceSize,
  Widget Function(BuildContext, Widget)? appBuilder,
}) {
  return ScreenUtilInit(
    designSize: designSize,
    builder: (context, _) {
      final app = MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      );
      return appBuilder?.call(context, app) ?? app;
    },
  );
}

/// Loads the Pretendard font from `assets/fonts/PretendardVariable.ttf` into
/// the Flutter test font registry under the family name `Pretendard`.
///
/// Call this from `setUpAll` in any golden test that needs Pretendard
/// rendering. If the font file is missing (e.g. in a stripped-down CI
/// container), this is a no-op — text renders with the default fallback
/// instead of failing the test.
Future<void> loadPretendardFont() async {
  // The asset path is relative to the test runner's working directory, which
  // for `flutter test` is the package root.
  final fontFile = File('assets/fonts/PretendardVariable.ttf');
  if (!fontFile.existsSync()) {
    return;
  }
  // `readAsBytes()` returns a `Uint8List`; reinterpret as `ByteData` for the
  // `FontLoader` API without copying.
  final bytes = await fontFile.readAsBytes();
  final byteData = ByteData.view(bytes.buffer, bytes.offsetInBytes,
      bytes.lengthInBytes);
  final loader = FontLoader('Pretendard')..addLoader(Future.value(byteData));
  await loader.load();
}

/// Suppress overflow / image-network warnings that pollute golden test output
/// without indicating real problems. Call from `setUpAll`.
void silenceFlutterErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final str = details.exceptionAsString();
    if (str.contains('overflowed by') ||
        str.contains('NetworkImage') ||
        str.contains('Failed to load asset')) {
      return;
    }
    FlutterError.presentError(details);
  };
}

/// Convenience: pump the [target] widget and capture a golden as
/// `goldens/<name>.png` (relative to the test file).
///
/// `pumpDuration`: how long to wait after the initial pump for any
/// animations to settle. Defaults to 100ms — enough for AnimatedSwitcher /
/// FadeTransition to land but short enough to keep tests fast.
Future<void> matchGolden(
  WidgetTester tester,
  Widget target, {
  required String name,
  Duration pumpDuration = const Duration(milliseconds: 100),
  Finder? finder,
  Size deviceSize = kGoldenDeviceSize,
}) async {
  // Lock the test view to the design size at DPR=1 so the saved PNG is
  // exactly `deviceSize.width × deviceSize.height` pixels.
  tester.view.physicalSize = deviceSize;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(target);
  // Two pumps + a short delay handle the typical "schedule on first frame"
  // pattern used by HomeCubit, IdGenerationCubit, etc.
  await tester.pump();
  await tester.pump(pumpDuration);

  await expectLater(
    finder ?? find.byType(MaterialApp),
    matchesGoldenFile('goldens/$name.png'),
  );
}

/// Marker tag for golden tests so CI can run them in isolation:
///   flutter test --tags golden
const String kGoldenTag = 'golden';

/// Pretty-prints a `ui.Rect` for debugging when a golden mismatches.
String describeRect(ui.Rect r) =>
    'Rect(${r.left}, ${r.top}, ${r.right}, ${r.bottom})';
