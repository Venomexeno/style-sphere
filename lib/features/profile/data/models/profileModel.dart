import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  final String name;
  final String email;
  final String avatar;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.avatar,
  }) : super(nameEntity: name, emailEntity: email, avatarEntity: avatar);

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
      );
}
