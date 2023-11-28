import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  final String? accessToken;
  final String? refreshToken;

  TokenModel({
    this.accessToken,
    this.refreshToken,
  }) : super(
            accessTokenEntity: accessToken!, refreshTokenEntity: refreshToken!);

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );
}
