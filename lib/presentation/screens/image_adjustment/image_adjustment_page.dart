import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_events.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_state.dart';
import 'package:image_editor/presentation/screens/image_adjustment/control_sliders.dart';
import 'package:image_editor/presentation/screens/image_adjustment/image_painter.dart';

class ImageAdjustmentPage extends StatefulWidget {
  final String imagePath;
  const ImageAdjustmentPage({super.key, required this.imagePath});

  @override
  _ImageAdjustmentPageState createState() => _ImageAdjustmentPageState();
}

class _ImageAdjustmentPageState extends State<ImageAdjustmentPage> {
  ui.FragmentProgram? program;
  ui.Image? image;
  OverlayEntry? overlayEntry;
  GlobalKey globalKey = GlobalKey();
  late File imageFile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    imageFile = File(widget.imagePath);
    print('Loading image from: ${widget.imagePath}');
    _loadResources();
  }

  Future<void> _loadResources() async {
    try {
      program = await ui.FragmentProgram.fromAsset('shaders/image-edit.frag');

      await _loadImageFromFile();
    } catch (e) {
      print('Failed to load resources: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadImageFromFile() async {
    try {
      final Uint8List bytes = await imageFile.readAsBytes();

      final ui.Image loadedImage = await decodeImageFromList(bytes);
      if (mounted) {
        setState(() {
          image = loadedImage;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Failed to load image: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageAdjustBloc(),
      child: GestureDetector(
        onTap: () => removeHighlightOverlay(),
        child: Scaffold(body: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () => removeHighlightOverlay(),
      child: BlocBuilder<ImageAdjustBloc, ImageAdjustState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height - 200,
                ),
                painter: ImagePainter(
                  shader: program!.fragmentShader(),
                  image: image!,
                  brightness: state.brightness,
                  constrast: state.contrast,
                ),
              ),
              Container(
                key: globalKey,
                child: GestureDetector(
                  onTap: () {
                    createHighlightOverlay(context);
                  },
                  child: const Icon(Icons.tune, size: 40),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void createHighlightOverlay(BuildContext context) {
    removeHighlightOverlay();

    assert(overlayEntry == null);

    RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      print('Cannot position overlay - renderBox is null');
      return;
    }

    Offset offset = renderBox.localToGlobal(Offset.zero);
    final bloc = context.read<ImageAdjustBloc>();

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, overlaySetState) {
            return Positioned(
              left: offset.dx - 200,
              top: offset.dy,
              child: Material(
                color: Colors.black.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        ControlsSlider(
                          title: "Brightness",
                          value: bloc.state.brightness,
                          onChanged: (value) {
                            bloc.add(ChangeBrightnessEvent(value));
                            overlaySetState(() {});
                          },
                        ),
                        ControlsSlider(
                          title: "Contrast",
                          value: bloc.state.contrast,
                          onChanged: (value) {
                            bloc.add(ChangeContrastEvent(value));
                            overlaySetState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeHighlightOverlay();
    super.dispose();
  }
}
