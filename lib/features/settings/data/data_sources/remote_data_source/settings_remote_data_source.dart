import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/features/settings/data/models/update_user_model.dart';
import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';
import 'package:ecommerce/features/settings/domain/use_cases/update_user_use_case.dart';

abstract class SettingsRemoteDataSource {
  Future<UpdateUserEntity> updateUser(UpdateUserParameters parameters);
}

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  @override
  Future<UpdateUserEntity> updateUser(UpdateUserParameters parameters) async {

    final response = await Dio().put(
      ApiConstants.getSingleUser('/${parameters.id}'),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: <String, dynamic>{
        'email': parameters.email,
        'name': parameters.name,
        'password': parameters.password,
      },
    );
    return UpdateUserModel.fromJson(response.data);
  }
}
