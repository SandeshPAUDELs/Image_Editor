import 'package:equatable/equatable.dart';

abstract class ImageInputState extends Equatable{
  @override
  List<Object> get props => [];
}
class ImageInputInitial extends ImageInputState{}
class ImageInputLoading extends ImageInputState{}

class ImageInputSuccess extends ImageInputState{
  final String imagePath;
   ImageInputSuccess({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}
class ImageInputFailure extends ImageInputState{
  final String message;
   ImageInputFailure({required this.message});
  @override
  List<Object> get props => [message];
}