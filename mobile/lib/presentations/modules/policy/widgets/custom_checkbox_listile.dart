import 'package:base_flutter/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckboxTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;

  const CustomCheckboxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.contentPadding,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: Border.all(
          color: value ? colors.primary : Colors.grey,
          width: value ? 2 : 1,
        ),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        activeColor: colors.primary,
        checkColor: Colors.white,
        side: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        title: Text(title),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
