part of 'new_arrivals_cubit.dart';

abstract class NewArrivalsState extends Equatable {
  const NewArrivalsState();

  @override
  List<Object> get props => [];
}

class NewArrivalsInitial extends NewArrivalsState {}

class NewArrivalsLoading extends NewArrivalsState {}

class NewArrivalsSuccess extends NewArrivalsState {
  final List<NewArrivalsEntity> newArrivals;

  const NewArrivalsSuccess(this.newArrivals);
}

class NewArrivalsFailure extends NewArrivalsState {
  final String errMessage;

  const NewArrivalsFailure(this.errMessage);
}
