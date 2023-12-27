import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class NavigationCubit extends Cubit<NavigationCubitState> {
  NavigationCubit() : super(NavigationInitialState());

  void navigateTo(int index) {
    emit(NavigationIndexChangedState(index));
  }
}