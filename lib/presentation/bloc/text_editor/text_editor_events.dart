import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DrawTextEvent extends Equatable {
  
  @override
  List<Object?> get props => [];
}

class UpdateText extends DrawTextEvent {
  final String text;
  UpdateText(this.text);
}

class UpdateFontSize extends DrawTextEvent {
  final double fontSize;
  UpdateFontSize(this.fontSize);
}

class UpdateTextColor extends DrawTextEvent {
  final Color color;
  UpdateTextColor(this.color);
}

class UpdateFontWeight extends DrawTextEvent {
  final FontWeight fontWeight;
  UpdateFontWeight(this.fontWeight);
}

class UpdateFontStyle extends DrawTextEvent {
  final FontStyle fontStyle;
  UpdateFontStyle(this.fontStyle);
}

class UpdateTextAlign extends DrawTextEvent {
  final TextAlign textAlign;
  UpdateTextAlign(this.textAlign);
}
