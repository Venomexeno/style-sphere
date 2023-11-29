
import 'package:ecommerce/features/auth/domain/entities/login_entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String? accessToken;
  final String? refreshToken;

  LoginModel({
    this.accessToken,
    this.refreshToken,
  }) : super(
            accessTokenEntity: accessToken!, refreshTokenEntity: refreshToken!);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );
}
