import 'package:equatable/equatable.dart';

abstract class ImageAdjustmentEvent extends Equatable {
  const ImageAdjustmentEvent();

  @override
  List<Object> get props => [];
}

class ChangeBrightness extends ImageAdjustmentEvent {
  final double brightness;

  const ChangeBrightness(this.brightness);

  @override
  List<Object> get props => [brightness];
}

class ChangeContrast extends ImageAdjustmentEvent {
  final double contrast;

  const ChangeContrast(this.contrast);

  @override
  List<Object> get props => [contrast];
}

class ChangeSaturation extends ImageAdjustmentEvent {
  final double saturation;

  const ChangeSaturation(this.saturation);

  @override
  List<Object> get props => [saturation];
}
class ChangeWhiteBalance extends ImageAdjustmentEvent{
  final double whiteBalance;
  const ChangeWhiteBalance(this.whiteBalance);
  @override
  List<Object> get props => [whiteBalance];
}
