import 'package:bloc/bloc.dart';
import 'package:image_editor/presentation/bloc/navigation/navigation_event.dart';
import 'package:image_editor/presentation/bloc/navigation/navigation_state.dart';




class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<ChangeHomeIndex>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}