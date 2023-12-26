part of 'bottom_navigation_cubit.dart';

abstract class NavigationCubitState extends Equatable {
  const NavigationCubitState();

  @override
  List<Object> get props => [];
}

class NavigationInitialState extends NavigationCubitState {}

class NavigationIndexChangedState extends NavigationCubitState {
  final int selectedIndex;

  const NavigationIndexChangedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}