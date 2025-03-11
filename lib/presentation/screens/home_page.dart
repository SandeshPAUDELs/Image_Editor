import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/imageINput/image_input_events.dart';
import 'package:image_editor/presentation/bloc/imageINput/image_input_state.dart';
import 'package:image_editor/presentation/bloc/imageINput/input_input_bloc.dart';
import 'package:image_editor/presentation/screens/texts/draw_text.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Editor')),
      body: BlocBuilder<ImageInputBloc, ImageInputState>(
        builder: (context, state) {
          if (state is ImageInputInitial) {
            return const Center(child: Text('No image selected.'));
          } else if (state is ImageInputLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ImageInputSuccess) {
            return Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DrawText(
                                imagePath: state.imagePath,
                              ),
                        ),
                      );                    },

                    icon: const Icon(Icons.edit),
                  ),
                  Expanded(
                    child: Image.file(
                      File(state.imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ImageInputFailure) {
            return const Center(child: Text('Failed to load image.'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ImageInputBloc>().add(
            PickImage(source: ImageSource.gallery),
          );
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
