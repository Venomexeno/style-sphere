import 'package:ecommerce/features/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );
}
