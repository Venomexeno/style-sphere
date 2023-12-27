import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:ecommerce/features/profile/domain/use_cases/fetch_profile_use_case.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> fetchProfile(FetchProfileParameters parameters);
}
