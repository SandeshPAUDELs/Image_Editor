import 'package:equatable/equatable.dart';

abstract class ImageAdjustEvent extends Equatable {
  const ImageAdjustEvent();
  @override
  List<Object> get props => [];
}


class ChangeBrightnessEvent extends ImageAdjustEvent {
  final double brightness;

   ChangeBrightnessEvent(this.brightness);
}

class ChangeContrastEvent extends ImageAdjustEvent {
  final double contrast;

   ChangeContrastEvent(this.contrast);
}