part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileEntity profile;

  const ProfileSuccess(this.profile);
}

class ProfileFailure extends ProfileState {
  final String errMessage;

  const ProfileFailure(this.errMessage);
}
