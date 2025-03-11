import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_events.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_state.dart';


class ImageAdjustmentBloc extends Bloc<ImageAdjustmentEvent, ImageAdjustmentState> {
  ImageAdjustmentBloc() : super(const ImageAdjustmentState()) {
    on<ChangeBrightness>((event, emit) {
      emit(state.copyWith(brightness: event.brightness));
    });

    on<ChangeContrast>((event, emit) {
      emit(state.copyWith(contrast: event.contrast));
    });

    on<ChangeSaturation>((event, emit) {
      emit(state.copyWith(saturation: event.saturation));
    });
    on<ChangeWhiteBalance>((event, emit) {
      emit(state.copyWith(whiteBalance: event.whiteBalance));
    });
  }
}
