import 'dart:async';

import 'package:base_flutter/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlockLoading extends StatefulWidget {
  const BlockLoading({super.key});

  @override
  State<BlockLoading> createState() => _BlockLoadingState();
}

class _BlockLoadingState extends State<BlockLoading> {
  final frames = [
    Assets.icons.block1.svg(width: 220.r),
    Assets.icons.block2.svg(width: 220.r),
    Assets.icons.block3.svg(width: 220.r),
    Assets.icons.block4.svg(width: 220.r),
    Assets.icons.block5.svg(width: 220.r),
    Assets.icons.block6.svg(width: 220.r),
    Assets.icons.block7.svg(width: 220.r),
    Assets.icons.block8.svg(width: 220.r),
    Assets.icons.block9.svg(width: 220.r),
    Assets.icons.block10.svg(width: 220.r),
    Assets.icons.block11.svg(width: 220.r),
    Assets.icons.block12.svg(width: 220.r),
    Assets.icons.block13.svg(width: 220.r),
    Assets.icons.block14.svg(width: 220.r),
    Assets.icons.block15.svg(width: 220.r),
    Assets.icons.block16.svg(width: 220.r),
    Assets.icons.block17.svg(width: 220.r),
    Assets.icons.block18.svg(width: 220.r),
    Assets.icons.block19.svg(width: 220.r),
    Assets.icons.block20.svg(width: 220.r),
    Assets.icons.block21.svg(width: 220.r),
    Assets.icons.block8.svg(width: 220.r),
    Assets.icons.block7.svg(width: 220.r),
    Assets.icons.block6.svg(width: 220.r),
    Assets.icons.block5.svg(width: 220.r),
    Assets.icons.block5.svg(width: 220.r),
  ];

  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (_) {
        setState(() {
          _index = (_index + 1) % frames.length;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: frames[_index],
    );
  }
}
