import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_event.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_state.dart';
import 'package:image_editor/presentation/screens/draw/custom_painter.dart';
import 'package:image_editor/presentation/widgets/color_picker_widget.dart';
import 'package:image_editor/presentation/widgets/custom_sliders_for_size.dart';

class DrawShapesView extends StatelessWidget {
  final String imagePath;
  const DrawShapesView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.file(File(imagePath)),
                BlocBuilder<ShapeBloc, ShapeState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap:
                          () => print(
                            'moving shape by draggin, Rotating shapes, Resizing shapes to be performed',
                          ),
                      child: CustomPaint(painter: ShapePainter(state.shapes)),
                    );
                  },
                ),
              ],
            ),
          ),
          ShapeControls(),
        ],
      ),
    );
  }
}

class ShapeControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),

                IconButton(
                  onPressed: () {
                    context.read<ShapeBloc>().add(AddRectangle(Colors.black));
                  },
                  icon: Icon(Icons.rectangle_outlined),
                ),

                IconButton(
                  onPressed: () {
                    context.read<ShapeBloc>().add(AddEllipse(Colors.black));
                  },
                  icon: Icon(Icons.circle_outlined),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 8,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: BlocBuilder<ShapeBloc, ShapeState>(
                        builder: (context, state) {
                          double currentStrokeWidth =
                              state.shapes.isNotEmpty
                                  ? state.shapes.last.strokeWidth
                                  : 3.0;
                          return CustomSlidersForSize.buildSliderforSize(
                            context,
                            currentStrokeWidth,
                            1.0,
                            10.0,
                            9,
                            (value) {
                              context.read<ShapeBloc>().add(
                                UpdateLastShapeStrokeWidth(value),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(flex: 2, child: Text('Size')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: BlocBuilder<ShapeBloc, ShapeState>(
                        builder: (context, state) {
                          double currentRotation =
                              state.shapes.isNotEmpty
                                  ? state.shapes.last.rotation
                                  : 0.0;
                          return CustomSlidersForSize.buildSliderforSize(
                            context,
                            currentRotation,
                            0.0,
                            360.0,
                            9,
                            (value) {
                              context.read<ShapeBloc>().add(
                                RotateShapeEvent(value),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(flex: 2, child: Text('Rotation')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: BlocBuilder<ShapeBloc, ShapeState>(
                        builder: (context, state) {
                          double currentSize =
                              state.shapes.isNotEmpty
                                  ? state.shapes.last.scale
                                  : 1.0;
                          return CustomSlidersForSize.buildSliderforSize(
                            context,
                            currentSize,
                            1.0,
                            10.0,
                            9,
                            (value) {
                              context.read<ShapeBloc>().add(
                                ResizeShapeEvent(value),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(flex: 2, child: Text('Resize')),
                  ],
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.red),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.blue),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.green),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.green,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.white),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.grey),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.red),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.blue),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.green),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.green,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ShapeBloc>().add(
                          UpdateLastShapeColor(Colors.white),
                        );
                      },
                      child: ColorPickerWidget.createColorPicker(
                        context,
                        Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
