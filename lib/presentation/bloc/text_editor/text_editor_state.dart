import 'package:flutter/material.dart';

class DrawTextState{
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;

  DrawTextState({
    this.text = "Sample Text",
    this.fontSize = 30,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
  });

  DrawTextState copyWith({
    String? text,
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextAlign? textAlign,
  }) {
    return DrawTextState(
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      textColor: textColor ?? this.textColor,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      textAlign: textAlign ?? this.textAlign,
    );
  }
}