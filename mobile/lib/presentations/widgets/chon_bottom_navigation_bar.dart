import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tabs in the CHON bottom navigation bar, in render order.
/// Center tab (`idCard`) is rendered as a raised circular FAB.
enum ChonNavTab {
  home,
  chon,
  idCard,
  mutualAuth,
  familyTree,
}

/// Bottom navigation bar matching the Figma `Navigation Bar_*` instances
/// (e.g. `348:19580`, `473:15426`, `473:15457`, `473:15488`, `473:15549`).
///
/// Spec (from Figma node `473:28002`, the instance used by the Home screen):
/// - Container 360×68, white surface, padding 8/20/12/20
/// - Five `Menu-item` slots, gap 48
/// - Each item: 50×52, vertical layout (icon 24×24 + label 12 Medium)
/// - Active label color `#5a5a5a`, inactive `#8e8e93`
/// - Center slot replaced with **circular FAB** 68×68, radius 50,
///   `#ffa000` background, white icon + label, raised `−12px`
///
/// The widget assumes you size icons to 24×24 (or 22×22 inside the FAB to
/// account for the rounded background).
class ChonBottomNavigationBar extends StatelessWidget {
  const ChonBottomNavigationBar({
    super.key,
    required this.selected,
    required this.onTap,
    required this.iconBuilder,
    this.labels = const _DefaultLabels(),
    this.elevation = 0,
  });

  /// Currently selected tab. Pass `ChonNavTab.idCard` to highlight the FAB.
  final ChonNavTab selected;

  /// Callback fired when a tab is tapped. Use to switch routes / pages.
  final ValueChanged<ChonNavTab> onTap;

  /// Provides the icon for each tab. Receives the tab and a flag indicating
  /// whether the tab is currently selected, so callers can swap to a filled
  /// variant. Return any widget; size yourself to ~24×24 (22×22 inside FAB).
  final Widget Function(ChonNavTab tab, bool isSelected) iconBuilder;

  /// Labels for each tab. Defaults match the Figma source ("홈", "CHON",
  /// "신분증", "상호인증", "가계도"). Override to localize via [S.of(context)].
  final ChonNavLabels labels;

  /// Optional shadow above the bar. Default is flat (matches Figma).
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChonColors.bgSurface,
      elevation: elevation,
      child: SizedBox(
        height: ChonShape.bottomNavHeight,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MenuItem(
                tab: ChonNavTab.home,
                label: labels.home,
                icon: iconBuilder(ChonNavTab.home, selected == ChonNavTab.home),
                isSelected: selected == ChonNavTab.home,
                onTap: () => onTap(ChonNavTab.home),
              ),
              _MenuItem(
                tab: ChonNavTab.chon,
                label: labels.chon,
                icon: iconBuilder(ChonNavTab.chon, selected == ChonNavTab.chon),
                isSelected: selected == ChonNavTab.chon,
                onTap: () => onTap(ChonNavTab.chon),
              ),
              _IdCardFab(
                label: labels.idCard,
                icon: iconBuilder(
                    ChonNavTab.idCard, selected == ChonNavTab.idCard),
                onTap: () => onTap(ChonNavTab.idCard),
              ),
              _MenuItem(
                tab: ChonNavTab.mutualAuth,
                label: labels.mutualAuth,
                icon: iconBuilder(
                    ChonNavTab.mutualAuth, selected == ChonNavTab.mutualAuth),
                isSelected: selected == ChonNavTab.mutualAuth,
                onTap: () => onTap(ChonNavTab.mutualAuth),
              ),
              _MenuItem(
                tab: ChonNavTab.familyTree,
                label: labels.familyTree,
                icon: iconBuilder(
                    ChonNavTab.familyTree, selected == ChonNavTab.familyTree),
                isSelected: selected == ChonNavTab.familyTree,
                onTap: () => onTap(ChonNavTab.familyTree),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.tab,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final ChonNavTab tab;
  final String label;
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? ChonColors.textSecondary : ChonColors.textTertiary;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: ChonShape.bottomNavMenuItem.width,
        height: ChonShape.bottomNavMenuItem.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 24.r, height: 24.r, child: Center(child: icon)),
              SizedBox(height: 8.h),
              Text(
                label,
                style: ChonTextStyles.navLabel(color: color),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdCardFab extends StatelessWidget {
  const _IdCardFab({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = ChonShape.bottomNavFabSize;
    return Transform.translate(
      // Figma raises the FAB by −12px from the bar's content row.
      offset: Offset(0, -12.h),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: ChonColors.brandPrimary,
            borderRadius: BorderRadius.circular(ChonShape.radiusPill),
          ),
          padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 24.r, height: 24.r, child: Center(child: icon)),
              SizedBox(height: 8.h),
              Text(
                label,
                style: ChonTextStyles.navLabel(color: ChonColors.textInverse),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Labels for each tab. Override the defaults to plug in localized strings.
class ChonNavLabels {
  const ChonNavLabels({
    required this.home,
    required this.chon,
    required this.idCard,
    required this.mutualAuth,
    required this.familyTree,
  });

  final String home;
  final String chon;
  final String idCard;
  final String mutualAuth;
  final String familyTree;
}

class _DefaultLabels extends ChonNavLabels {
  const _DefaultLabels()
      : super(
          home: '홈',
          chon: 'CHON',
          idCard: '신분증',
          mutualAuth: '상호인증',
          familyTree: '가계도',
        );
}
