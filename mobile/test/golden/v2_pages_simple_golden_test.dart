/// Golden tests for v2 pages that have no Cubit / Repo dependencies.
///
/// These pages render purely from constructor args, so they make the most
/// reliable goldens — minimal mocking surface, fewest sources of flake.
///
/// To regenerate after an intentional design change:
/// ```
/// flutter test test/golden/v2_pages_simple_golden_test.dart --update-goldens
/// ```
import 'package:base_flutter/presentations/modules/mutual_auth_offline/mutual_auth_offline_entry_page.dart';
import 'package:base_flutter/presentations/modules/splash/splash_page_v2.dart';
import 'package:base_flutter/presentations/modules/tutorial/tutorial_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_test_harness.dart';

void main() {
  setUpAll(() async {
    silenceFlutterErrors();
    await loadPretendardFont();
  });

  group('v2 simple pages — golden', () {
    testWidgets('SplashPageV2 — first frame layout', (tester) async {
      await matchGolden(
        tester,
        goldenHarness(SplashPageV2(
          // Long timer so the redirect doesn't fire mid-test.
          redirectAfter: const Duration(seconds: 60),
          onRedirect: () {},
        )),
        name: 'splash_page_v2',
      );
    }, tags: kGoldenTag);

    testWidgets('TutorialPage — step 1', (tester) async {
      await matchGolden(
        tester,
        goldenHarness(TutorialPage(
          onFinish: () {},
          onSkip: () {},
        )),
        name: 'tutorial_page_step1',
      );
    }, tags: kGoldenTag);

    testWidgets('MutualAuthOfflineEntryPage — both action cards',
        (tester) async {
      await matchGolden(
        tester,
        goldenHarness(MutualAuthOfflineEntryPage(
          onShowMyQr: () {},
          onScanQr: () {},
        )),
        name: 'mutual_auth_offline_entry_page',
      );
    }, tags: kGoldenTag);
  });
}
