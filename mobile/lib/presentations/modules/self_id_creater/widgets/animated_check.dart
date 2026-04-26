import 'dart:ui';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCheck extends StatefulWidget {
  final VoidCallback? onComplete;
  const AnimatedCheck({super.key, this.onComplete});

  @override
  State<AnimatedCheck> createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progress;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    progress = CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });

    Future.delayed(
      Durations.short4,
      () {
        controller.forward();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.r,
      height: 100.r,
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.all(12.r),
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, child) {
          return CustomPaint(
            painter: CheckPainter(progress.value),
            size: Size(200.r, 200.r),
          );
        },
      ),
    );
  }
}

class CheckPainter extends CustomPainter {
  final double progress;

  CheckPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8.r
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final p1 = Offset(size.width * 0.25, size.height * 0.55);
    final p2 = Offset(size.width * 0.45, size.height * 0.75);
    final p3 = Offset(size.width * 0.75, size.height * 0.3);

    final fullPath = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy);

    final PathMetrics metrics = fullPath.computeMetrics();
    final Path path = Path();

    for (final m in metrics) {
      final segment = m.extractPath(0, m.length * progress);
      path.addPath(segment, Offset.zero);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CheckPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
