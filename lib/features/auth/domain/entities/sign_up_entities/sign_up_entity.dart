import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String nameEntity;
  final String emailEntity;
  final String passwordEntity;
  final String avatarEntity;
  final String roleEntity;
  final int idEntity;

  const SignUpEntity({
    required this.nameEntity,
    required this.emailEntity,
    required this.passwordEntity,
    required this.avatarEntity,
    required this.roleEntity,
    required this.idEntity,
  });

  @override
  List<Object?> get props => [
        nameEntity,
        emailEntity,
        passwordEntity,
        avatarEntity,
        roleEntity,
        idEntity,
      ];
}
