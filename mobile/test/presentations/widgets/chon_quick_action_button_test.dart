import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/widgets/chon_quick_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/// Wraps a widget in the bare minimum needed to render — MaterialApp +
/// ScreenUtilInit. Pretendard font is registered in pubspec.yaml so it
/// loads automatically when tests run via `flutter test`.
Widget _harness(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, _) => MaterialApp(
      home: Scaffold(
        backgroundColor: ChonColors.bgPage,
        body: Center(child: child),
      ),
    ),
  );
}

void main() {
  group('ChonQuickActionButton', () {
    testWidgets('renders the label and fires onTap once', (tester) async {
      var taps = 0;
      await tester.pumpWidget(_harness(ChonQuickActionButton(
        icon: const Icon(Icons.call_outlined, key: Key('icon')),
        label: '연락하기\n(가계도)',
        onTap: () => taps++,
      )));

      expect(find.text('연락하기\n(가계도)'), findsOneWidget);
      expect(find.byKey(const Key('icon')), findsOneWidget);

      await tester.tap(find.byType(ChonQuickActionButton));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('renders at the spec 76×76 size', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionButton(
        icon: const SizedBox.shrink(),
        label: 'QR 코드',
        onTap: () {},
      )));

      final box = tester.getSize(find.byType(ChonQuickActionButton));
      // 76 * ScreenUtil scale (1.0 here since designSize matches default).
      expect(box.width, closeTo(76.0, 0.5));
      expect(box.height, closeTo(76.0, 0.5));
    });

    testWidgets('Semantics label collapses newlines', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionButton(
        icon: const SizedBox.shrink(),
        label: '연락하기\n(가계도)',
        onTap: () {},
      )));

      // Default semanticLabel replaces \n with space for screen readers.
      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.label, isNot(contains('\n')));
    });

    testWidgets('semanticLabel override wins over label', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionButton(
        icon: const SizedBox.shrink(),
        label: '연락하기\n(가계도)',
        semanticLabel: 'Contact a family member',
        onTap: () {},
      )));
      expect(
        find.bySemanticsLabel('Contact a family member'),
        findsAtLeastNWidgets(1),
      );
    });
  });

  group('ChonQuickActionGrid', () {
    testWidgets('renders the optional section label', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionGrid(
        actions: [
          ChonQuickActionButton(
            icon: const SizedBox.shrink(),
            label: 'A',
            onTap: () {},
          ),
        ],
      )));
      expect(find.text('입력 정보'), findsOneWidget);
    });

    testWidgets('hides label when null is passed', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionGrid(
        label: null,
        actions: [
          ChonQuickActionButton(
            icon: const SizedBox.shrink(),
            label: 'A',
            onTap: () {},
          ),
        ],
      )));
      expect(find.text('입력 정보'), findsNothing);
    });

    testWidgets('asserts when more than 4 actions are passed', (tester) async {
      expect(
        () => ChonQuickActionGrid(
          actions: List.generate(
            5,
            (_) => ChonQuickActionButton(
              icon: const SizedBox.shrink(),
              label: 'X',
              onTap: () {},
            ),
          ),
        ),
        throwsAssertionError,
      );
    });

    testWidgets('renders all four ChonQuickActions helpers', (tester) async {
      await tester.pumpWidget(_harness(ChonQuickActionGrid(
        actions: [
          ChonQuickActions.contact(
              icon: const SizedBox.shrink(), onTap: () {}),
          ChonQuickActions.editProfile(
              icon: const SizedBox.shrink(), onTap: () {}),
          ChonQuickActions.qrCode(
              icon: const SizedBox.shrink(), onTap: () {}),
          ChonQuickActions.support(
              icon: const SizedBox.shrink(), onTap: () {}),
        ],
      )));

      expect(find.text('연락하기\n(가계도)'), findsOneWidget);
      expect(find.text('프로필 수정'), findsOneWidget);
      expect(find.text('QR 코드'), findsOneWidget);
      expect(find.text('고객센터'), findsOneWidget);
    });
  });
}
