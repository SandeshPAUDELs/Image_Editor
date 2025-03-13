import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_events.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_state.dart';
import 'package:image_editor/presentation/screens/texts/custom_painter.dart';
import 'package:image_editor/presentation/widgets/color_picker_widget.dart';
import 'package:image_editor/presentation/widgets/custom_sliders_for_size.dart';

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
    Colors.yellow,
    Colors.teal,
    Colors.amber,
  ];

  final List<String> fontStyles = ['Normal', 'Bold', 'Italic'];
  final List<String> textAlignments = ['Center', 'Left', 'Right'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawTextBloc(),
      child: Scaffold(
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
                          top: 80,
                          left: state.textAlign == TextAlign.left ? 10 : null,
                          right: state.textAlign == TextAlign.right ? 10 : null,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  CustomPaint(
                                    painter: DottedBorderPainter(
                                      dashWidth: 10,
                                      dashSpace: 10,
                                      color: Colors.blue,
                                      strokeWidth: 1,
                                    ),
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                              UpdateFontWeight(
                                                FontWeight.normal,
                                              ),
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
                                      SizedBox(width: 20),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomSlidersForSize.buildSliderforSize(
                                context,
                                state.fontSize,
                                1.0,
                                10.0,
                                32,
                                (value) {
                                  context.read<DrawTextBloc>().add(
                                    UpdateFontSize(value),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () => _showTextInputDialog(context),
                              icon: Icon(Icons.text_fields),
                            ),
                            Expanded(flex: 2, child: Text('Size')),
                          ],
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

                                    child: Row(
                                      children: [
                                        ColorPickerWidget.createColorPicker(
                                          context,
                                          color,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
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

void _showTextInputDialog(BuildContext context) {
  TextEditingController textController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Enter Your Text"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Type here"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<DrawTextBloc>().add(UpdateText(textController.text));
              Navigator.pop(dialogContext);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
