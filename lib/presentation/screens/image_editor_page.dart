import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class CustomEditor extends StatelessWidget {
  final String imagePath;

  const CustomEditor({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    File imageFile = File(imagePath);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
      ),
      body: Column(
        children: [
          Expanded(
            child: imageFile.existsSync()
              ? Image.file(imageFile)
              : const Center(
                  child: Text('Failed to load image.'),
                ),
          ),
          ElevatedButton(
            onPressed: () async {
              final outputFile = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageEditor(
                    image: imageFile.readAsBytesSync(),
                  ),
                ),
              );

            },
            child: const Text('Crop Image'),
          ),
        ],
      ),
    );
  }
}

