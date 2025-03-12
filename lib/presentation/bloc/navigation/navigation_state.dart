// import 'package:equatable/equatable.dart';

// abstract class NavigationState extends Equatable{
//   final int currentIndex;
//   const NavigationState(this.currentIndex);
//   @override
//   List<Object> get props => [currentIndex];
// }
// class InitialNavigation extends NavigationState{
//   const InitialNavigation() : super(0);
// }
// class UpdatedNavigation extends NavigationState{
//   const UpdatedNavigation(super.currentIndex);
// }
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int selectedIndex;

  const NavigationState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
