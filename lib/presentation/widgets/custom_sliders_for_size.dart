import 'package:flutter/material.dart';
import 'package:image_editor/style/colors.dart';

class CustomSlidersForSize {
  static SliderTheme buildSliderforSize(
    BuildContext context,
    double value,
    double min,
    double max,
    int divisions,
    Function onChanged,
  ) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.textFieldBorderColor,
        inactiveTrackColor: AppColors.successColor,
        thumbColor: AppColors.surfaceColor,
      ),
      child: Slider(
        min: min,
        max: max,
        divisions: divisions,
        value: value,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
