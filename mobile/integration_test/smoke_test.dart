import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/splash/splash_page_v2.dart';
import 'package:base_flutter/presentations/modules/tutorial/tutorial_page.dart';

/// Smoke integration test — does the app boot and a couple of v2 pages
/// render without throwing? This is intentionally minimal: it doesn't
/// touch GoRouter or real services. It exercises:
///
///   1. Splash v2 page rendering (logo + auto-redirect timer)
///   2. Tutorial page rendering (default localized steps)
///
/// Run with:
/// ```bash
/// flutter test integration_test/smoke_test.dart
/// ```
///
/// On a real device:
/// ```bash
/// flutter test integration_test/smoke_test.dart -d <device_id>
/// ```
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CHON v2 smoke', () {
    testWidgets('Splash v2 boots with the logo and CHON wordmark',
        (tester) async {
      var redirected = false;
      await tester.pumpWidget(MaterialApp(
        home: SplashPageV2(
          redirectAfter: const Duration(milliseconds: 200),
          onRedirect: () => redirected = true,
        ),
      ));
      await tester.pump();

      expect(find.text('CHON'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 250));
      expect(redirected, isTrue,
          reason: 'Redirect callback must fire after the timer.');
    });

    testWidgets('Tutorial renders Skip + Next CTAs', (tester) async {
      await tester.pumpWidget(MaterialApp(
        // Avoid hitting S.current — supply explicit steps so this test
        // stays independent of the localization state.
        home: TutorialPage(
          steps: const [
            TutorialStep(
              title: 'Step 1',
              body: 'Body 1',
              illustration: TutorialIllustration.shield,
            ),
            TutorialStep(
              title: 'Step 2',
              body: 'Body 2',
              illustration: TutorialIllustration.start,
              isFinalStep: true,
            ),
          ],
          onFinish: () {},
          onSkip: () {},
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Step 1'), findsOneWidget);
      expect(find.byKey(const Key('tutorial.next')), findsOneWidget);
      expect(find.byKey(const Key('tutorial.skip')), findsOneWidget);
    });

    testWidgets('ChonColors design tokens are reachable at runtime',
        (tester) async {
      // Cheap sanity check that the design token library loads.
      expect(ChonColors.bgPage.value, 0xFFF5F5F5);
      expect(ChonColors.brandPrimary.value, 0xFFFFA000);
      expect(ChonColors.textPrimary.value, 0xFF1E1E1E);
    });
  });
}
