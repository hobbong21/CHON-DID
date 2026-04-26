import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/splash/splash_page_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _harness(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, _) => MaterialApp(home: child),
  );
}

void main() {
  group('SplashPageV2', () {
    testWidgets('renders the logo and the CHON wordmark', (tester) async {
      await tester.pumpWidget(_harness(SplashPageV2(
        redirectAfter: const Duration(seconds: 60),
        onRedirect: () {},
      )));

      expect(find.byKey(const Key('splash.logo')), findsOneWidget);
      expect(find.text('CHON'), findsOneWidget);
    });

    testWidgets('uses ChonColors.bgPage as the background', (tester) async {
      await tester.pumpWidget(_harness(SplashPageV2(
        redirectAfter: const Duration(seconds: 60),
        onRedirect: () {},
      )));
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, ChonColors.bgPage);
    });

    testWidgets('fires onRedirect after redirectAfter elapses',
        (tester) async {
      var redirected = 0;
      await tester.pumpWidget(_harness(SplashPageV2(
        redirectAfter: const Duration(milliseconds: 500),
        onRedirect: () => redirected++,
      )));

      // Before the timer, no redirect.
      await tester.pump(const Duration(milliseconds: 100));
      expect(redirected, 0);

      // After the timer fires.
      await tester.pump(const Duration(milliseconds: 500));
      expect(redirected, 1);
    });

    testWidgets('does NOT redirect if disposed before timer fires',
        (tester) async {
      var redirected = 0;
      await tester.pumpWidget(_harness(SplashPageV2(
        redirectAfter: const Duration(milliseconds: 500),
        onRedirect: () => redirected++,
      )));

      // Replace the page before the timer fires.
      await tester.pumpWidget(_harness(const SizedBox.shrink()));
      await tester.pump(const Duration(seconds: 1));
      expect(redirected, 0);
    });
  });
}
