import 'package:bloc/bloc.dart';
import 'package:image_editor/presentation/bloc/image_input_events.dart';
import 'package:image_editor/presentation/bloc/image_input_state.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputBloc extends Bloc<ImageInputEvent, ImageInputState> {
  ImagePicker picker = ImagePicker();
  ImageInputBloc() : super(ImageInputInitial()) {
    on<PickImage>((event, emit) async {
      emit(ImageInputLoading());
      try {
        final XFile? image = await picker.pickImage(source: event.source);
        if (image != null) {
          emit(ImageInputSuccess(imagePath: image.path));
        }
      } catch (e) {
        emit(ImageInputFailure(message: e.toString()));
      }
    });
  }
}
