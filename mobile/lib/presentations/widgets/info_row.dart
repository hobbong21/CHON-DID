import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final String? lable;
  final String? value;
  final Widget? lableWidget;
  final Widget? valueWidget;
  const InfoRow(
      {super.key, this.lable, this.value, this.lableWidget, this.valueWidget});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        lableWidget ??
            Text(
              lable ?? '',
              style: theme.textTheme.bodyMedium,
            ),
        SizedBox(width: 8.w),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: valueWidget ??
                Text(
                  value ?? '',
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
          ),
        ),
      ],
    );
  }
}
