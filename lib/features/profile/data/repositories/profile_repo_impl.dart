import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/profile/data/data_sources/remote_data_source/profile_remote_data_source.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:ecommerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:ecommerce/features/profile/domain/use_cases/fetch_profile_use_case.dart';

class ProfileRepoImpl extends ProfileRepo {

  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile(
      FetchProfileParameters parameters) async {
    try {
      var profile =
          await profileRemoteDataSource.fetchProfile(parameters);
      return right(profile);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
