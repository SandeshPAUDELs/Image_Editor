import 'package:flutter/material.dart';
import 'package:image_editor/style/colors.dart';

class ControlsSlider extends StatelessWidget {
  const ControlsSlider({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.min,
    this.max,
  });
  final String title;
  final double value;
  final double? min;
  final double? max;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.textFieldBorderColor,
              inactiveTrackColor: AppColors.successColor,
              thumbColor: AppColors.surfaceColor,
            ),
            child: Slider(
              min: min ?? 0,
              max: max ?? 1,
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
        Text(title, style: const TextStyle(color: AppColors.black)),
      ],
    );
  }
}
