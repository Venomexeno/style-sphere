part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final TokenEntity token;

  const LoginSuccess(this.token);
}

class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure(this.errMessage);
}
