import 'package:base_flutter/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  final Color color;
  const Logo({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Assets.icons.logo2.svg(
      width: 80.r,
      height: 20.r,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
