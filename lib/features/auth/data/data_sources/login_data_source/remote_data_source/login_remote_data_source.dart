import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/features/auth/data/models/login_models/login_model.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases/fetch_token_use_case.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> fetchToken(LoginParameters parameters);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<LoginEntity> fetchToken(LoginParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.login,
      data: <String, dynamic>{
        "email": parameters.email,
        "password": parameters.password,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return LoginModel.fromJson(response.data);
  }
}
