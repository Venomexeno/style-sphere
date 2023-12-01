import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';

class UpdateUserModel extends UpdateUserEntity {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  const UpdateUserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
  }) : super(
          idEntity: id,
          emailEntity: email,
          passwordEntity: password,
          nameEntity: name,
          roleEntity: role,
          avatarEntity: avatar,
        );

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );
  //
  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "email": email,
  //       "password": password,
  //       "name": name,
  //       "role": role,
  //       "avatar": avatar,
  //     };
}
