import 'dart:ui' show Color, Offset;

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




class MoveShapeEvent extends ShapeEvent {
  final Offset newPosition;

  MoveShapeEvent(this.newPosition);

  @override
  List<Object?> get props => [newPosition];
}

class RotateShapeEvent extends ShapeEvent {
  final double newRotation;

  RotateShapeEvent(this.newRotation);

  @override
  List<Object?> get props => [newRotation];
}

class ResizeShapeEvent extends ShapeEvent {
  final double newScale;

  ResizeShapeEvent(this.newScale);

  @override
  List<Object?> get props => [newScale];
}
