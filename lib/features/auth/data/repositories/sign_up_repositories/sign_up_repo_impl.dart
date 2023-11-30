import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/sign_up_data_source/remote_data_source/sign_up_remote_data_source.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/sign_up_repositories/sign_up_repo.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';

class SignUpRepoImpl extends SignUpRepo {
  final SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepoImpl(this.signUpRemoteDataSource);

  @override
  Future<Either<Failure, CheckEmailEntity>> checkEmail(
      CheckEmailParameters parameters) async {
    try {
      var checkEmail = await signUpRemoteDataSource.checkEmail(parameters);
      return right(checkEmail);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignUpEntity>> signUp(
      SignUpParameters parameters) async {
    try {
      var signUp = await signUpRemoteDataSource.signUp(parameters);
      return right(signUp);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
