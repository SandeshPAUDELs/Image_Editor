import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_events.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_state.dart';
import 'package:image_editor/presentation/screens/image_adjustment/control_sliders.dart';

class ImageAdjustmentPage extends StatefulWidget {
  final String imagePath;

  const ImageAdjustmentPage({super.key, required this.imagePath});

  @override
  _ImageAdjustmentPageState createState() => _ImageAdjustmentPageState();
}

class _ImageAdjustmentPageState extends State<ImageAdjustmentPage> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final File file = File(widget.imagePath);
    final Uint8List bytes = await file.readAsBytes();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frame = await codec.getNextFrame();

    setState(() {
      _image = frame.image;
    });
  }

  ColorFilter _getColorFilter(
    double brightness,
    double contrast,
    double saturation,
  ) {
    return ColorFilter.matrix([
      contrast * saturation,
      0,
      0,
      0,
      brightness * 255,
      0,
      contrast * saturation,
      0,
      0,
      brightness * 255,
      0,
      0,
      contrast * saturation,
      0,
      brightness * 255,
      0,
      0,
      0,
      1,
      0,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImageAdjustmentBloc, ImageAdjustmentState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child:
                      _image == null
                          ? const CircularProgressIndicator()
                          : ColorFiltered(
                            colorFilter: _getColorFilter(
                              state.brightness,
                              state.contrast,
                              state.saturation,
                            ),
                            child: RawImage(image: _image),
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ControlsSlider(
                      title: 'Brightness',
                      value: state.brightness,
                      onChanged: (value) {
                        context.read<ImageAdjustmentBloc>().add(
                          ChangeBrightness(value),
                        );
                      },
                    ),
                    ControlsSlider(
                      title: 'Contrast',
                      value: state.contrast,
                      onChanged: (value) {
                        context.read<ImageAdjustmentBloc>().add(
                          ChangeContrast(value),
                        );
                      },
                    ),
                    ControlsSlider(
                      title: 'Saturation',
                      value: state.saturation,
                      onChanged: (value) {
                        context.read<ImageAdjustmentBloc>().add(
                          ChangeSaturation(value),
                        );
                      },
                    ),
                    ControlsSlider(
                      title: 'WhiteBalance',
                      value: state.whiteBalance,
                      onChanged: (value) {
                        context.read<ImageAdjustmentBloc>().add(
                          ChangeWhiteBalance(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
