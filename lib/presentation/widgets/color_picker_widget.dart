import 'package:flutter/material.dart';

class ColorPickerWidget {
  static Container createColorPicker(BuildContext context, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: MediaQuery.of(context).size.width * 0.06,
      height: MediaQuery.of(context).size.width * 0.06,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
