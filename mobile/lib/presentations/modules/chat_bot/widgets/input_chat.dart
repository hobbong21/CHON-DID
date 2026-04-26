import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/input_decoration_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputChat extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onTapSend;
  const InputChat({super.key, required this.controller, this.onTapSend});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: colors.background,
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        minLines: 1,
        decoration: InputDecorationApp.secondary(colors).copyWith(
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
            child: Assets.icons.icGpt.svg(width: 32.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.r),
            child: InkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                onTapSend?.call();
              },
              child: Assets.images.icSend.image(width: 24.r),
            ),
          ),
          hintText: S.current.hint_ask_anything,
        ),
      ),
    );
  }
}
