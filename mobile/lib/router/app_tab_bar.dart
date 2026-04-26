import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'route_aware_mixin.dart';

class AppTabBar extends StatefulWidget {
  final List<GlobalKey<TabFocus<StatefulWidget>>> focusKeys;
  const AppTabBar(
      {super.key, required this.navigationShell, this.focusKeys = const []});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar>
    with RouteAware, RouteAwareMixin {
  int? _oldIndex = 0;

  @override
  void onFocus() {
    widget.focusKeys
        .elementAtOrNull(widget.navigationShell.currentIndex)
        ?.currentState
        ?.onFocus();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.navigationShell.currentIndex != _oldIndex) {
      _oldIndex = widget.navigationShell.currentIndex;
      onFocus();
    }
    final colors = context.colors;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            top: 12.h,
            left: 16.w,
            right: 16.w,
            bottom: 4.h + ScreenUtil().bottomBarHeight),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.white,
          border: Border(top: BorderSide(color: colors.border)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.r),
          width: double.infinity,
          height: 72.r,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item(
                    0,
                    Icon(Icons.home, color: colors.blueText, size: 20.r),
                    Icon(Icons.home, color: colors.black, size: 20.r),
                    S.current.home,
                  ),
                  item(
                    2,
                    Icon(Icons.settings, color: colors.blueText, size: 20.r),
                    Icon(Icons.settings, color: colors.black, size: 20.r),
                    S.current.settings,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index, Widget icon, Widget iconSelected, String label) {
    final colors = context.colors;
    final isSelected = widget.navigationShell.currentIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.navigationShell.goBranch(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected ? iconSelected : icon,
          Text(
            label,
            style: context.theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? colors.white : colors.blueText,
            ),
          ),
        ],
      ),
    );
  }
}

mixin TabFocus<T extends StatefulWidget> on State<T> {
  onFocus();
}
