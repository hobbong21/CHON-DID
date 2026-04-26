import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subTitle;
  final VoidCallback? onPress;
  final bool isSelected;
  const Item({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    this.onPress,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: colors.lightYellow,
          end: isSelected ? colors.darkYellow : colors.lightYellow,
        ),
        duration: Durations.medium2,
        curve: Curves.easeOut,
        builder: (context, c, w) {
          return ElevatedButton(
            onPressed: onPress ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: c,
              foregroundColor: colors.darkYellow,
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: ChonColors.bgPage,
                    borderRadius: BorderRadius.circular(48.r),
                  ),
                  child: icon,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium,
                      ),
                      if (subTitle != null)
                        Text(subTitle!, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
