import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_event.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_state.dart';
import 'package:image_editor/presentation/screens/draw/custom_painter.dart';
import 'package:image_editor/presentation/widgets/color_picker_widget.dart';

class DrawShapesView extends StatelessWidget {
  final String imagePath;
  const DrawShapesView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draw Shapes')),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.file(File(imagePath)),
                BlocBuilder<ShapeBloc, ShapeState>(
                  builder: (context, state) {
                    return CustomPaint(
                      painter: ShapePainter(state.shapes),
                      child: Container(),
                    );
                  },
                ),
              ],
            ),
          ),
          ShapeControls(),
          BlocBuilder<ShapeBloc, ShapeState>(
            builder: (context, state) {
              double currentStrokeWidth =
                  state.shapes.isNotEmpty ? state.shapes.last.strokeWidth : 3.0;

              return Slider(
                value: currentStrokeWidth,
                min: 1.0,
                max: 10.0,
                divisions: 9,
                onChanged: (value) {
                  context.read<ShapeBloc>().add(
                    UpdateLastShapeStrokeWidth(value),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ShapeControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<ShapeBloc>().add(AddRectangle(Colors.black));
          },
          child: Text("Add Rectangle"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ShapeBloc>().add(AddEllipse(Colors.black));
          },
          child: Text("Add Ellipse"),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<ShapeBloc>().add(UpdateLastShapeColor(Colors.red));
              },
              child: ColorPickerWidget.createColorPicker(context, Colors.red),
            ),
            GestureDetector(
              onTap: () {
                context.read<ShapeBloc>().add(
                  UpdateLastShapeColor(Colors.blue),
                );
              },
              child: ColorPickerWidget.createColorPicker(context, Colors.blue),
            ),
            GestureDetector(
              onTap: () {
                context.read<ShapeBloc>().add(
                  UpdateLastShapeColor(Colors.green),
                );
              },
              child: ColorPickerWidget.createColorPicker(context, Colors.green),
            ),
            GestureDetector(
              onTap: () {
                context.read<ShapeBloc>().add(
                  UpdateLastShapeColor(Colors.white),
                );
              },
              child: ColorPickerWidget.createColorPicker(context, Colors.white),
            ),
            GestureDetector(
              onTap: () {
                context.read<ShapeBloc>().add(
                  UpdateLastShapeColor(Colors.grey),
                );
              },
              child: ColorPickerWidget.createColorPicker(context, Colors.grey),
            ),

          ],
        ),
      ],
    );
  }
}