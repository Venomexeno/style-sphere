import 'package:equatable/equatable.dart';

class UpdateUserEntity extends Equatable {
  final int idEntity;
  final String emailEntity;
  final String passwordEntity;
  final String nameEntity;
  final String roleEntity;
  final String avatarEntity;

  const UpdateUserEntity({
    required this.idEntity,
    required this.emailEntity,
    required this.passwordEntity,
    required this.nameEntity,
    required this.roleEntity,
    required this.avatarEntity,
  });

  @override
  List<Object?> get props => [
        idEntity,
        emailEntity,
        passwordEntity,
        nameEntity,
        roleEntity,
        avatarEntity,
      ];
}
