import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'profile_entity.g.dart';

@HiveType(typeId: 2)
class ProfileEntity extends Equatable {
  @HiveField(0)
  final String nameEntity;
  @HiveField(1)
  final String emailEntity;
  @HiveField(2)
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
