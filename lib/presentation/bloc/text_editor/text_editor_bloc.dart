import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_events.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_state.dart';

class DrawTextBloc extends Bloc<DrawTextEvent, DrawTextState> {
  DrawTextBloc() : super(DrawTextState()) {
    on<UpdateText>((event, emit) => emit(state.copyWith(text: event.text)));
    on<UpdateFontSize>(
      (event, emit) => emit(state.copyWith(fontSize: event.fontSize)),
    );
    on<UpdateTextColor>(
      (event, emit) => emit(state.copyWith(textColor: event.color)),
    );
    on<UpdateFontWeight>(
      (event, emit) => emit(state.copyWith(fontWeight: event.fontWeight)),
    );
    on<UpdateFontStyle>(
      (event, emit) => emit(state.copyWith(fontStyle: event.fontStyle)),
    );
    on<UpdateTextAlign>(
      (event, emit) => emit(state.copyWith(textAlign: event.textAlign)),
    );
    
  }
}
