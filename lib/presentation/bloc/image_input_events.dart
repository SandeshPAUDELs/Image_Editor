import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageInputEvent extends Equatable{
  const ImageInputEvent();
  @override
  List<Object> get props => [];
}
class PickImage extends ImageInputEvent{
  final ImageSource source;
  const PickImage({required this.source});
  @override
  List<Object> get props => [source];
}