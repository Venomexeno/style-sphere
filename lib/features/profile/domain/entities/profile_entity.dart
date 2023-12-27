import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String nameEntity;
  final String emailEntity;
  final String avatarEntity;

  const ProfileEntity({
    required this.nameEntity,
    required this.emailEntity,
    required this.avatarEntity,
  });

  @override
  List<Object?> get props => [
        nameEntity,
        emailEntity,
    avatarEntity,
      ];
}
