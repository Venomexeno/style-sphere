import 'package:ecommerce/core/constants/api_service.dart';
import 'package:ecommerce/features/auth/data/models/token_model.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/fetch_token_use_case.dart';

abstract class LoginRemoteDataSource {
  Future<TokenEntity> fetchToken(LoginParameters parameters);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<TokenEntity> fetchToken(LoginParameters parameters) async {
    var data = await apiService.post(
        endPoint:
            'auth/login?email=${parameters.email}&password=${parameters.password}');

    var result = TokenModel.fromJson(data);

    return result;
  }
}
