import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';

abstract class SignUpRepo {
  Future<Either<Failure, CheckEmailEntity>> checkEmail(
      CheckEmailParameters parameters);

  Future<Either<Failure, SignUpEntity>> signUp(
      SignUpParameters parameters);
}
