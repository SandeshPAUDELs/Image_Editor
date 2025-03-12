import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';

abstract class ShapeEvent extends Equatable {}

class AddRectangle extends ShapeEvent {
  final Color color;
  AddRectangle(this.color);

  @override
  // TODO: implement props
  List<Object?> get props => [color];
}

class AddEllipse extends ShapeEvent {
  final Color color;
  AddEllipse(this.color);
  @override
  // TODO: implement props
  List<Object?> get props => [color];
}

class UpdateLastShapeColor extends ShapeEvent {
  final Color color;
  UpdateLastShapeColor(this.color);
  @override
  // TODO: implement props
  List<Object?> get props => [color];
}

class UpdateLastShapeStrokeWidth extends ShapeEvent {
  final double strokeWidth;
  UpdateLastShapeStrokeWidth(this.strokeWidth);
  @override
  // TODO: implement props
  List<Object?> get props => [strokeWidth];
}
