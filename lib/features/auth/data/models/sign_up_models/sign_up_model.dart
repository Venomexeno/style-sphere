import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  final String? email;
  final String? name;
  final String? password;
  final String? avatar;
  final String? role;
  final int? id;

  SignUpModel(
      {this.email, this.name, this.password, this.avatar, this.role, this.id})
      : super(
          nameEntity: name!,
          emailEntity: email!,
          passwordEntity: password!,
          avatarEntity: avatar!,
          roleEntity: role!,
          idEntity: id!,
        );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
      );
}
