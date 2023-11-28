import 'package:ecommerce/core/constants/api_service.dart';
import 'package:ecommerce/features/auth/data/models/token_model.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';

abstract class LoginRemoteDataSource {
  Future<TokenEntity> fetchToken();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<TokenEntity> fetchToken() async {
    var data = await apiService.post(endPoint: 'auth/login?email=john@mail.com&password=changeme');

    var result = TokenModel.fromJson(data);
    
    return result;
  }
}
