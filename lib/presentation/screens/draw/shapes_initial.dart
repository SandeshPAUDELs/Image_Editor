
import 'package:flutter/material.dart' show Color, Rect;

abstract class Shape {
  Color get color;
  double get strokeWidth;

  Shape copyWith({Color? color, double? strokeWidth});
}

class RectangleShape extends Shape {
  @override
  final Color color;
  @override
  final double strokeWidth;
  final Rect rect;

  RectangleShape(this.color, {this.strokeWidth = 3.0})
    : rect = Rect.fromLTWH(50, 50, 100, 100);

  @override
  RectangleShape copyWith({Color? color, double? strokeWidth}) {
    return RectangleShape(
      color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}

class EllipseShape extends Shape {
  @override
  final Color color;
  @override
  final double strokeWidth;
  final Rect rect;

  EllipseShape(this.color, {this.strokeWidth = 3.0})
    : rect = Rect.fromLTWH(100, 100, 120, 80);

  @override
  EllipseShape copyWith({Color? color, double? strokeWidth}) {
    return EllipseShape(
      color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}
