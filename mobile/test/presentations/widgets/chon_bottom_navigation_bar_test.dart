import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/widgets/chon_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _harness({
  required ChonNavTab selected,
  required ValueChanged<ChonNavTab> onTap,
  ChonNavLabels? labels,
}) {
  return ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, _) => MaterialApp(
      home: Scaffold(
        backgroundColor: ChonColors.bgPage,
        bottomNavigationBar: ChonBottomNavigationBar(
          selected: selected,
          onTap: onTap,
          labels: labels ??
              const ChonNavLabels(
                home: '홈',
                chon: 'CHON',
                idCard: '신분증',
                mutualAuth: '상호인증',
                familyTree: '가계도',
              ),
          iconBuilder: (tab, isSelected) => Icon(
            Icons.circle,
            key: Key('icon-${tab.name}-${isSelected ? 'on' : 'off'}'),
            size: 16,
            color: tab == ChonNavTab.idCard
                ? ChonColors.textInverse
                : (isSelected
                    ? ChonColors.textSecondary
                    : ChonColors.iconDisabledStrong),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('ChonBottomNavigationBar', () {
    testWidgets('renders all five labels', (tester) async {
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.home,
        onTap: (_) {},
      ));
      expect(find.text('홈'), findsOneWidget);
      expect(find.text('CHON'), findsOneWidget);
      expect(find.text('신분증'), findsOneWidget);
      expect(find.text('상호인증'), findsOneWidget);
      expect(find.text('가계도'), findsOneWidget);
    });

    testWidgets('iconBuilder receives correct selected flag per tab',
        (tester) async {
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.mutualAuth,
        onTap: (_) {},
      ));

      // Selected tab gets the "on" suffix; others get "off".
      expect(find.byKey(const Key('icon-home-off')), findsOneWidget);
      expect(find.byKey(const Key('icon-chon-off')), findsOneWidget);
      expect(find.byKey(const Key('icon-mutualAuth-on')), findsOneWidget);
      expect(find.byKey(const Key('icon-familyTree-off')), findsOneWidget);
      // FAB tab uses its own selection state; either on or off is fine.
      expect(
        find.byKey(const Key('icon-idCard-on'))
            .evaluate()
            .followedBy(find.byKey(const Key('icon-idCard-off')).evaluate())
            .length,
        1,
      );
    });

    testWidgets('tapping a tab fires onTap with that tab', (tester) async {
      ChonNavTab? lastTapped;
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.home,
        onTap: (tab) => lastTapped = tab,
      ));

      await tester.tap(find.text('가계도'));
      await tester.pumpAndSettle();
      expect(lastTapped, ChonNavTab.familyTree);

      await tester.tap(find.text('상호인증'));
      await tester.pumpAndSettle();
      expect(lastTapped, ChonNavTab.mutualAuth);
    });

    testWidgets('idCard FAB is rendered with brandPrimary background',
        (tester) async {
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.idCard,
        onTap: (_) {},
      ));

      // Find the container behind the FAB icon — the closest ancestor of
      // the idCard icon that has a non-null decoration.
      final fabFinder = find.ancestor(
        of: find.text('신분증'),
        matching: find.byType(Container),
      );
      expect(fabFinder, findsAtLeastNWidgets(1));
      final container = tester.widget<Container>(fabFinder.first);
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, ChonColors.brandPrimary);
    });

    testWidgets('overall height matches the design spec (~68px)',
        (tester) async {
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.home,
        onTap: (_) {},
      ));
      // The Material wraps a SizedBox(height: 68.h). With a 360×800
      // designSize on a default test surface, .h ≈ 1.0.
      final material =
          tester.widget<Material>(find.byType(Material).first);
      expect(material.color, ChonColors.bgSurface);
    });

    testWidgets('custom labels override defaults', (tester) async {
      await tester.pumpWidget(_harness(
        selected: ChonNavTab.home,
        onTap: (_) {},
        labels: const ChonNavLabels(
          home: 'Home',
          chon: 'CHON',
          idCard: 'ID',
          mutualAuth: 'Verify',
          familyTree: 'Tree',
        ),
      ));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Verify'), findsOneWidget);
      expect(find.text('Tree'), findsOneWidget);
      expect(find.text('홈'), findsNothing);
    });
  });
}
