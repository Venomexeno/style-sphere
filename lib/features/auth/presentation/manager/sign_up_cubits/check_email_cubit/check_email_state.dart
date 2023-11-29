part of 'check_email_cubit.dart';

abstract class CheckEmailState extends Equatable {
  const CheckEmailState();

  @override
  List<Object> get props => [];
}

class CheckEmailInitial extends CheckEmailState {}

class CheckEmailLoading extends CheckEmailState {}

class CheckEmailSuccess extends CheckEmailState {
  final CheckEmailEntity checkEmail;

  const CheckEmailSuccess(this.checkEmail);
}

class CheckEmailFailure extends CheckEmailState {
  final String errMessage;

  const CheckEmailFailure(this.errMessage);
}
