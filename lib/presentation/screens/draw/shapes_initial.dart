import 'package:flutter/material.dart' show Color, Rect, Offset;

abstract class Shape {
  Color get color;
  double get strokeWidth;
  Offset get position;
  double get rotation;
  double get scale;

  Shape copyWith({
    Color? color,
    double? strokeWidth,
    Offset? position,
    double? rotation,
    double? scale,
  });
}

class RectangleShape extends Shape {
  @override
  final Color color;
  @override
  final double strokeWidth;
  @override
  final Offset position;
  @override
  final double rotation;
  @override
  final double scale;
  final Rect rect;

  RectangleShape(
    this.color, {
    this.strokeWidth = 3.0,
    this.position = const Offset(50, 50),
    this.rotation = 0.0,
    this.scale = 1.0,
  }) : rect = Rect.fromLTWH(position.dx, position.dy, 100 * scale, 100 * scale);

  @override
  RectangleShape copyWith({
    Color? color,
    double? strokeWidth,
    Offset? position,
    double? rotation,
    double? scale,
  }) {
    return RectangleShape(
      color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      scale: scale ?? this.scale,
    );
  }
}

class EllipseShape extends Shape {
  @override
  final Color color;
  @override
  final double strokeWidth;
  @override
  final Offset position;
  @override
  final double rotation;
  @override
  final double scale;
  final Rect rect;

  EllipseShape(
    this.color, {
    this.strokeWidth = 3.0,
    this.position = const Offset(100, 100),
    this.rotation = 0.0,
    this.scale = 1.0,
  }) : rect = Rect.fromLTWH(position.dx, position.dy, 120 * scale, 80 * scale);

  @override
  EllipseShape copyWith({
    Color? color,
    double? strokeWidth,
    Offset? position,
    double? rotation,
    double? scale,
  }) {
    return EllipseShape(
      color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      scale: scale ?? this.scale,
    );
  }
}
