import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String? title;
  final Color? tintColor;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  const Header(
      {super.key, this.title, this.actions, this.tintColor, this.onBack});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    final canPop = Navigator.of(context).canPop();
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 4.h,
        bottom: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (canPop)
            ElevatedButton(
              onPressed: () {
                if (onBack != null) {
                  onBack?.call();
                } else {
                  AppNavigator.pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.lightYellow,
                foregroundColor: colors.darkYellow,
                minimumSize: Size(100.r, 44.r),
              ),
              child: Text(
                S.current.back,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.black,
                ),
              ),
            ),
          if (actions == null) Spacer(),
          Text(
            title ?? '',
            style: theme.textTheme.titleMedium?.copyWith(color: tintColor),
            maxLines: 1,
          ),
          if (actions != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [for (final w in actions!) w],
            ),
        ],
      ),
    );
  }
}
