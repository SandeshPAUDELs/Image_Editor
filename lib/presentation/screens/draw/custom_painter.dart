import 'package:flutter/material.dart';
import 'package:image_editor/presentation/screens/draw/shapes_initial.dart';

class ShapePainter extends CustomPainter {
  final List<Shape> shapes;
  ShapePainter(this.shapes);

  @override
  void paint(Canvas canvas, Size size) {
    for (var shape in shapes) {
      final paint = Paint()
        ..color = shape.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = shape.strokeWidth;

      if (shape is RectangleShape) {
        canvas.drawRect(shape.rect, paint);
      } else if (shape is EllipseShape) {
        canvas.drawOval(shape.rect, paint);
      } 
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}