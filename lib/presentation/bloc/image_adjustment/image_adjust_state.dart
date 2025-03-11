import 'package:equatable/equatable.dart';

class ImageAdjustmentState extends Equatable {
  final double brightness;
  final double contrast;
  final double whiteBalance;
  final double saturation;

  const ImageAdjustmentState({
    this.brightness = 0,
    this.contrast = 1,
    this.whiteBalance = 0,
    this.saturation = 1,
  });

  ImageAdjustmentState copyWith({
    double? brightness,
    double? contrast,
    double? whiteBalance,
    double? saturation,
  }) {
    return ImageAdjustmentState(
      brightness: brightness ?? this.brightness,
      contrast: contrast ?? this.contrast,
      whiteBalance: whiteBalance ?? this.whiteBalance,
      saturation: saturation ?? this.saturation,
    );
  }

  @override
  List<Object> get props => [brightness, contrast, saturation, whiteBalance];
}
