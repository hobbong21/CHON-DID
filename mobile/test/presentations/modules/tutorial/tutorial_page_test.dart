import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/tutorial/tutorial_page.dart';
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
  group('TutorialPage', () {
    testWidgets('renders the first step on initial build', (tester) async {
      await tester.pumpWidget(_harness(TutorialPage(
        onFinish: () {},
        onSkip: () {},
      )));
      await tester.pumpAndSettle();

      // Default first step title.
      expect(find.text('나를 확인 받는\nCHON DID'), findsOneWidget);
      expect(find.text('다음'), findsOneWidget);
      expect(find.text('건너뛰기'), findsOneWidget);
      expect(find.text('시작하기'), findsNothing);
    });

    testWidgets('Next button advances pages and switches label on last step',
        (tester) async {
      await tester.pumpWidget(_harness(TutorialPage(
        onFinish: () {},
        onSkip: () {},
      )));
      await tester.pumpAndSettle();

      Future<void> tapNext() async {
        await tester.tap(find.byKey(const Key('tutorial.next')));
        await tester.pumpAndSettle();
      }

      await tapNext(); // 1 → 2
      expect(find.text('서로를 인증하는\n상호 인증'), findsOneWidget);

      await tapNext(); // 2 → 3
      expect(find.text('나의 가족과 함께\n가계도'), findsOneWidget);

      await tapNext(); // 3 → 4
      expect(find.text('CHON과 함께\n시작해 볼까요?'), findsOneWidget);
      // On the last step the button label flips.
      expect(find.text('시작하기'), findsOneWidget);
      expect(find.text('다음'), findsNothing);
    });

    testWidgets('tapping 시작하기 on last step calls onFinish',
        (tester) async {
      var finished = 0;
      await tester.pumpWidget(_harness(TutorialPage(
        onFinish: () => finished++,
        onSkip: () {},
      )));
      await tester.pumpAndSettle();

      // Jump to last step.
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('tutorial.next')));
        await tester.pumpAndSettle();
      }
      expect(find.text('시작하기'), findsOneWidget);

      await tester.tap(find.text('시작하기'));
      await tester.pumpAndSettle();
      expect(finished, 1);
    });

    testWidgets('tapping 건너뛰기 calls onSkip', (tester) async {
      var skipped = 0;
      await tester.pumpWidget(_harness(TutorialPage(
        onFinish: () {},
        onSkip: () => skipped++,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('tutorial.skip')));
      await tester.pumpAndSettle();
      expect(skipped, 1);
    });

    testWidgets('respects a custom step list', (tester) async {
      const steps = [
        TutorialStep(
          title: 'Custom 1',
          body: 'Body 1',
          illustration: TutorialIllustration.shield,
        ),
        TutorialStep(
          title: 'Custom 2',
          body: 'Body 2',
          illustration: TutorialIllustration.start,
          isFinalStep: true,
        ),
      ];
      await tester.pumpWidget(_harness(TutorialPage(
        steps: steps,
        onFinish: () {},
        onSkip: () {},
      )));
      await tester.pumpAndSettle();

      expect(find.text('Custom 1'), findsOneWidget);
      expect(find.text('Custom 2'), findsNothing);

      await tester.tap(find.byKey(const Key('tutorial.next')));
      await tester.pumpAndSettle();
      expect(find.text('Custom 2'), findsOneWidget);
      expect(find.text('시작하기'), findsOneWidget);
    });

    testWidgets('uses ChonColors.bgPage and brandPrimary for the CTA',
        (tester) async {
      await tester.pumpWidget(_harness(TutorialPage(
        onFinish: () {},
        onSkip: () {},
      )));
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, ChonColors.bgPage);

      final btn = tester.widget<ElevatedButton>(
          find.byKey(const Key('tutorial.next')));
      final style = btn.style!;
      final bg = style.backgroundColor!.resolve({})!;
      expect(bg, ChonColors.brandPrimary);
    });
  });
}
