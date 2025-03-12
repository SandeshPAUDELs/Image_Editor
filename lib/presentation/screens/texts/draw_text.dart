import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_events.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_state.dart';
import 'package:image_editor/presentation/screens/texts/custom_painter.dart';

class DrawText extends StatelessWidget {
  final String imagePath;
  DrawText({super.key, required this.imagePath});

  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> fontStyles = ['Normal', 'Bold', 'Italic'];
  final List<String> textAlignments = ['Center', 'Left', 'Right'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawTextBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Text to Image')),
        body: BlocBuilder<DrawTextBloc, DrawTextState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.file(File(imagePath)),
                        Positioned(
                          top: 50,
                          left: state.textAlign == TextAlign.left ? 10 : null,
                          right: state.textAlign == TextAlign.right ? 10 : null,

                          child: CustomPaint(
                            painter: DottedBorderPainter(
                              dashWidth: 10,
                              dashSpace: 10,
                              color: Colors.blue,
                              strokeWidth: 1,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.text,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: state.fontSize,
                                  color: state.textColor,
                                  fontWeight: state.fontWeight,
                                  fontStyle: state.fontStyle,
                                ),
                                textAlign: state.textAlign,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Slider(
                          value: state.fontSize,
                          min: 1.0,
                          max: 10.0,
                          divisions: 9,

                          onChanged: (value) {
                            context.read<DrawTextBloc>().add(
                              UpdateFontSize(value),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              colors.map((color) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<DrawTextBloc>().add(
                                        UpdateTextColor(color),
                                      );
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              state.textColor == color
                                                  ? Colors.white
                                                  : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        DropdownButton<String>(
                          value: fontStyles[0],
                          onChanged: (String? newValue) {
                            if (newValue == 'Bold') {
                              context.read<DrawTextBloc>().add(
                                UpdateFontWeight(FontWeight.bold),
                              );
                            } else if (newValue == 'Italic') {
                              context.read<DrawTextBloc>().add(
                                UpdateFontStyle(FontStyle.italic),
                              );
                            } else {
                              context.read<DrawTextBloc>().add(
                                UpdateFontWeight(FontWeight.normal),
                              );
                              context.read<DrawTextBloc>().add(
                                UpdateFontStyle(FontStyle.normal),
                              );
                            }
                          },
                          items:
                              fontStyles
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                        ),
                        DropdownButton<String>(
                          value: textAlignments[0],
                          onChanged: (String? newValue) {
                            if (newValue == 'Left') {
                              context.read<DrawTextBloc>().add(
                                UpdateTextAlign(TextAlign.left),
                              );
                            } else if (newValue == 'Right') {
                              context.read<DrawTextBloc>().add(
                                UpdateTextAlign(TextAlign.right),
                              );
                            } else {
                              context.read<DrawTextBloc>().add(
                                UpdateTextAlign(TextAlign.center),
                              );
                            }
                          },
                          items:
                              textAlignments
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
