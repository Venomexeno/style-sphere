import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/fetch_token_use_case.dart';

abstract class LoginRepo {
  Future<Either<Failure, TokenEntity>> fetchToken(LoginParameters parameters);
}
