import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/core/functions/profile_functions/save_profile_data.dart';
import 'package:ecommerce/features/profile/data/models/profileModel.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:ecommerce/features/profile/domain/use_cases/fetch_profile_use_case.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> fetchProfile(FetchProfileParameters parameters);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  @override
  Future<ProfileEntity> fetchProfile(FetchProfileParameters parameters) async {
    final response = await Dio().get(ApiConstants.getUserWithSession,
        options:
            Options(headers: {"Authorization": "Bearer ${parameters.token}"}));

    var profile = ProfileModel.fromJson(response.data);

    saveProfileData(profile, kProfile);

    return profile;
  }
}
