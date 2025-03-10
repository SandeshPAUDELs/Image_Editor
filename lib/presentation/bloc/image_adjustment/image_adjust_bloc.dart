import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_events.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_state.dart';

class ImageAdjustBloc extends Bloc<ImageAdjustEvent, ImageAdjustState>{
  ImageAdjustBloc() : super (ImageAdjustState(brightness: 0, contrast: 0)) {
    on<ChangeBrightnessEvent>((event, emit) {
      emit(state.copyWith(brightness: event.brightness));
    });
    on<ChangeContrastEvent>((event, emit) {
      emit(state.copyWith(contrast: event.contrast));
    });
  }

}