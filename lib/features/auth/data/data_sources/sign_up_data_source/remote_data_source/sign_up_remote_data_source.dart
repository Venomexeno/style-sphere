import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_models/check_email_model.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_models/sign_up_model.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';

abstract class SignUpRemoteDataSource {
  Future<CheckEmailEntity> checkEmail(CheckEmailParameters parameters);

  Future<SignUpEntity> signUp(SignUpParameters parameters);
}

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  @override
  Future<CheckEmailEntity> checkEmail(CheckEmailParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.checkEmail,
      data: <String, dynamic>{
        "email": parameters.email,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return CheckEmailModel.fromJson(response.data);
  }

  @override
  Future<SignUpEntity> signUp(SignUpParameters parameters) async {

    final response = await Dio().post(
      ApiConstants.signUp,
      data: <String, dynamic>{
        "name": parameters.name,
        "email": parameters.email,
        "password": parameters.password,
        "avatar": "https://picsum.photos/800",
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return SignUpModel.fromJson(response.data);
  }
}
