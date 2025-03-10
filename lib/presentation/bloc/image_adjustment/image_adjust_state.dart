class ImageAdjustState {
  final double brightness;
  final double contrast;

  ImageAdjustState({required this.brightness, required this.contrast});

  ImageAdjustState copyWith({double? brightness, double? contrast}) {
    return ImageAdjustState(
      brightness: brightness ?? this.brightness,
      contrast: contrast ?? this.contrast,
    );
  }
List<Object> get props => [brightness, contrast];
}

