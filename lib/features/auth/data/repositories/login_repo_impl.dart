import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote_data_source/login_remote_data_source/login_remote_data_source.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repo.dart';
import 'package:ecommerce/features/auth/domain/use_cases/fetch_token_use_case.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<Failure, TokenEntity>> fetchToken(
      LoginParameters parameters
      ) async {
    try {
      var token = await loginRemoteDataSource.fetchToken(parameters);
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
