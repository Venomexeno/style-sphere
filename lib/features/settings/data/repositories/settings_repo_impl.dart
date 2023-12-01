import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';
import 'package:ecommerce/features/settings/domain/repositories/settings_repo.dart';
import 'package:ecommerce/features/settings/domain/use_cases/update_user_use_case.dart';

class SettingsRepoImpl extends SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;

  SettingsRepoImpl(this.settingsRemoteDataSource);

  @override
  Future<Either<Failure, UpdateUserEntity>> updateUser(
      UpdateUserParameters parameters) async {
    try {
      var updateUser = await settingsRemoteDataSource.updateUser(parameters);
      return right(updateUser);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
