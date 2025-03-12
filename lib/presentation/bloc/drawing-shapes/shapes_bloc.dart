import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_event.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_state.dart';
import 'package:image_editor/presentation/screens/draw/shapes_initial.dart';

class ShapeBloc extends Bloc<ShapeEvent, ShapeState> {
  ShapeBloc() : super(ShapeInitial()) {
    on<AddRectangle>((event, emit) {
      final newShapes = List<Shape>.from(state.shapes)
        ..add(RectangleShape(event.color));
      emit(ShapeUpdated(newShapes));
    });

    on<AddEllipse>((event, emit) {
      final newShapes = List<Shape>.from(state.shapes)
        ..add(EllipseShape(event.color));
      emit(ShapeUpdated(newShapes));
    });

    on<UpdateLastShapeColor>((event, emit) {
      if (state.shapes.isNotEmpty) {
        final updatedShapes = List<Shape>.from(state.shapes);
        final lastShape = updatedShapes.removeLast();
        updatedShapes.add(lastShape.copyWith(color: event.color));
        emit(ShapeUpdated(updatedShapes));
      }
    });

    on<UpdateLastShapeStrokeWidth>((event, emit) {
      if (state.shapes.isNotEmpty) {
        final updatedShapes = List<Shape>.from(state.shapes);
        final lastShape = updatedShapes.removeLast();
        updatedShapes.add(lastShape.copyWith(strokeWidth: event.strokeWidth));
        emit(ShapeUpdated(updatedShapes));
      }
    });
  }
}
