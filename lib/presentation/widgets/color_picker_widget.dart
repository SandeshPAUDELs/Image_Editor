import 'package:flutter/material.dart';

class ColorPickerWidget {
  static  Container createColorPicker(BuildContext context, Color color) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
      );
  }
}