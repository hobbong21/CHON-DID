import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SafeAreaBottom extends StatelessWidget {
  final Widget? child;
  const SafeAreaBottom({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: child ?? SizedBox.shrink(),
        ));
  }
}
