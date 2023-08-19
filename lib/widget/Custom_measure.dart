import 'package:flutter/material.dart';

class TemperatureLimitPainter extends CustomPainter {
  final double temperature;
  final double maxTemperature;

  TemperatureLimitPainter(
      {required this.temperature, required this.maxTemperature});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final center = Offset(radius, radius);

    // Draw the temperature limit circle
    final limitCirclePaint = Paint()
      ..color = Color.fromRGBO(217, 217, 217, 0.68)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0;

    canvas.drawCircle(center, radius - 6, limitCirclePaint);

    // Draw the current temperature arc
    final angle = 2 * 3.14159 * (temperature / maxTemperature);
    final temperatureArcPaint = Paint()
      ..color = Color.fromRGBO(11, 55, 120, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 6),
        -3.14159 / 2, angle, false, temperatureArcPaint);

    // Draw the temperature text in the center
    final temperatureText = TextSpan(
      text: temperature
          .toStringAsFixed(1), // Display temperature with 1 decimal place
      style: TextStyle(color: Color.fromRGBO(11, 55, 120, 1), fontSize: 18.0),
    );
    final textPainter = TextPainter(
      text: temperatureText,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2,
            center.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
