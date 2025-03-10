import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final ui.FragmentShader shader;
  final ui.Image image;
  // final ui.File image;
  final double brightness;
  final double constrast;

  ImagePainter({
    super.repaint,
    required this.shader,
    required this.image,
    required this.brightness,
    required this.constrast,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(3, brightness);
    shader.setFloat(4, constrast);
    shader.setImageSampler(0, image);
    paint.shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
