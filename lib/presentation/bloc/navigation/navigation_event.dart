import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => [];
}

class ChangeHomeIndex extends NavigationEvent {
  final int index;
  const ChangeHomeIndex(this.index);
  @override
  List<Object> get props => [index];
}