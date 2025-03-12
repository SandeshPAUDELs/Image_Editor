import 'package:image_editor/presentation/screens/draw/shapes_initial.dart';

abstract class ShapeState {
  final List<Shape> shapes;
  ShapeState(this.shapes);
}

class ShapeInitial extends ShapeState {
  ShapeInitial() : super([]);
}

class ShapeUpdated extends ShapeState {
  ShapeUpdated(List<Shape> shapes) : super(shapes);
}
