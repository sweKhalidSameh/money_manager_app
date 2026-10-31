import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A small smooth line chart without axes, used inside stat cards.
/// The first point is on the left and the last point on the right.
class SparklineChart extends StatelessWidget {
  const SparklineChart({
    super.key,
    required this.points,
    required this.color,
    this.height = 40,
    this.showEndDot = true,
  });

  final List<double> points;
  final Color color;
  final double height;
  final bool showEndDot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _SparklinePainter(
          points: points,
          color: color,
          showEndDot: showEndDot,
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({
    required this.points,
    required this.color,
    required this.showEndDot,
  });

  final List<double> points;
  final Color color;
  final bool showEndDot;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    const padding = 5.0;
    final minValue = points.reduce(math.min);
    final maxValue = points.reduce(math.max);
    final range = (maxValue - minValue) == 0 ? 1.0 : maxValue - minValue;
    final stepX = (size.width - padding * 2) / (points.length - 1);
    final usableHeight = size.height - padding * 2;

    final offsets = <Offset>[
      for (var i = 0; i < points.length; i++)
        Offset(
          padding + stepX * i,
          padding + usableHeight * (1 - (points[i] - minValue) / range),
        ),
    ];

    final path = Path()..moveTo(offsets.first.dx, offsets.first.dy);
    for (var i = 0; i < offsets.length - 1; i++) {
      final current = offsets[i];
      final next = offsets[i + 1];
      final midX = (current.dx + next.dx) / 2;
      path.cubicTo(midX, current.dy, midX, next.dy, next.dx, next.dy);
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );

    if (showEndDot) {
      canvas.drawCircle(offsets.last, 4, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) =>
      oldDelegate.points != points ||
      oldDelegate.color != color ||
      oldDelegate.showEndDot != showEndDot;
}
