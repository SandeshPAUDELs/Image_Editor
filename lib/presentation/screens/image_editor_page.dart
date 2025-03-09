import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class CustomEditor extends StatelessWidget {
  final String imagePath;

  const CustomEditor({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ImageEditor(
              image: FileImage(File(imagePath)),
            ),
          ),
        ],
      ),
    );
  }
}