import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorder extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashGap;
  final double radius;

  const DashedBorder({
    super.key,
    required this.child,
    this.strokeWidth = 1,
    this.color = Colors.blueGrey,
    this.dashLength = 6,
    this.dashGap = 4,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: strokeWidth,
        color: color,
        dashLength: dashLength,
        dashGap: dashGap,
        radius: radius,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashGap;
  final double radius;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.color,
    required this.dashLength,
    required this.dashGap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final Path original = Path()..addRRect(rrect);
    final Path dashedPath = _createDashedPath(original);

    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path source) {
    final Path dest = Path();
    final PathMetrics pm = source.computeMetrics();

    for (final PathMetric metric in pm) {
      double distance = 0.0;

      while (distance < metric.length) {
        final double next = distance + dashLength;
        dest.addPath(
          metric.extractPath(
            distance,
            next.clamp(0, metric.length),
          ),
          Offset.zero,
        );
        distance = next + dashGap;
      }
    }

    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
