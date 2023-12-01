part of 'update_user_cubit.dart';

abstract class UpdateUserState extends Equatable {
  @override
  List<Object> get props => [];

  const UpdateUserState();
}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final UpdateUserEntity updateUser;

  const UpdateUserSuccess({required this.updateUser});
}

class UpdateUserFailure extends UpdateUserState {
  final String errMessage;

  const UpdateUserFailure({required this.errMessage});
}
