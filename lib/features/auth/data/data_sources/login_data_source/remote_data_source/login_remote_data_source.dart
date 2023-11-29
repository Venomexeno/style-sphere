import 'package:ecommerce/core/constants/api_service.dart';
import 'package:ecommerce/features/auth/data/models/login_models/login_model.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases/fetch_token_use_case.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> fetchToken(LoginParameters parameters);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginEntity> fetchToken(LoginParameters parameters) async {
    var data = await apiService.post(
        endPoint:
            'auth/login?email=${parameters.email}&password=${parameters.password}');

    var result = LoginModel.fromJson(data);

    return result;
  }
}
