import 'package:ecommerce/core/constants/api_service.dart';
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
  final ApiService apiService;

  SignUpRemoteDataSourceImpl(this.apiService);

  @override
  Future<CheckEmailEntity> checkEmail(CheckEmailParameters parameters) async {
    var data = await apiService.postUrlEncoded(
      dataParameter: <String, dynamic>{
        "email": parameters.email,
      },
      endPoint: 'users/is-available',
    );

    var result = CheckEmailModel.fromJson(data);

    return result;
  }

  @override
  Future<SignUpEntity> signUp(SignUpParameters parameters) async {
    var data = await apiService.postUrlEncoded(
      endPoint: 'users/',
      dataParameter: <String, dynamic>{
        "name": parameters.name,
        "email": parameters.email,
        "password": parameters.password,
        "avatar": "https://picsum.photos/800",
      },
    );
    var result = SignUpModel.fromJson(data);
    return result;
  }
}
