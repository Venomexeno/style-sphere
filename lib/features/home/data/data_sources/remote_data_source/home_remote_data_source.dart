import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/core/functions/home_functions/save_category_data.dart';
import 'package:ecommerce/core/functions/home_functions/save_new_arrivals_data.dart';
import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/data/models/new_arrivals_model.dart';
import 'package:ecommerce/features/home/data/models/user_model.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_user_use_case.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewArrivalsEntity>> fetchNewArrivals();

  Future<UserEntity> fetchUser(FetchUserParameters parameters);

  Future<List<CategoryEntity>> fetchCategories();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<NewArrivalsEntity>> fetchNewArrivals() async {
    final response = await Dio().get(ApiConstants.getFirst10Products);
    final newArrivals = List<NewArrivalsEntity>.from(
      (response.data as List).map(
        (newArrivals) => NewArrivalsModel.fromJson(newArrivals),
      ),
    );

    saveNewArrivalsData(newArrivals, kNewArrivals);
    return newArrivals;
  }

  @override
  Future<UserEntity> fetchUser(FetchUserParameters parameters) async {
    final response = await Dio().get(ApiConstants.getUserWithSession,
        options:
            Options(headers: {"Authorization": "Bearer ${parameters.token}"}));
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    final response = await Dio().get(ApiConstants.getAllCategories);
    final category = List<CategoryEntity>.from(
      (response.data as List)
          .map((categories) => CategoryModel.fromJson(categories)),
    );
    saveCategoryData(category, kCategory);
    return category;
  }
}
