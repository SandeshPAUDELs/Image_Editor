
import 'package:flutter/material.dart';

class TextItem {
  final Offset position;
  final String text;
  final bool isEditing;

  TextItem({required this.position, required this.text, this.isEditing = false});

  TextItem copyWith({Offset? position, String? text, bool? isEditing}) {
    return TextItem(
      position: position ?? this.position,
      text: text ?? this.text,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
