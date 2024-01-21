import 'package:flutter/material.dart';

class SphereWidget extends CustomPainter {
  final double sliderValue;

  SphereWidget(this.sliderValue);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = _getColor();

    final double centerX = size.width / 2.0;
    final double centerY = size.height / 2.0;

    final double radius = size.width / 2.0;
    // dessiner la sphère
    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  Color _getColor() {
    return HSVColor.fromAHSV(1.0, 360.0 * sliderValue, 1.0, 1.0).toColor();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
