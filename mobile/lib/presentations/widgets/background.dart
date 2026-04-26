import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.primary,
      child: Stack(
        children: [
          Positioned(right: 0, child: Assets.icons.decorate1.svg()),
          Positioned(
            right: 0,
            top: 300,
            child: Assets.icons.decorate2.svg(width: ScreenUtil().screenWidth),
          ),
          Positioned(top: 600, child: Assets.icons.decorate3.svg()),
          child,
        ],
      ),
    );
  }
}
