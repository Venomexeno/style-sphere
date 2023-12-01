import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';
import 'package:ecommerce/features/settings/domain/use_cases/update_user_use_case.dart';

abstract class SettingsRepo{
  Future<Either<Failure,UpdateUserEntity>> updateUser(UpdateUserParameters parameters);
}