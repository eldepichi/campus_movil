import 'package:flutter/material.dart';

class CircunferenciaPainter extends CustomPainter {
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;

  CircunferenciaPainter({
    required this.color,
    required this.style,
    required this.strokeWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = color
      ..style = style
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
