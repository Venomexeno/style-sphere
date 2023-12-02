import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/features/category_products/data/models/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/use_cases/fetch_category_products_use_case.dart';

abstract class CategoryProductsRemoteDataSource {
  Future<List<CategoryProductsEntity>> fetchCategoryProducts(
      FetchCategoryProductParameters parameters);
}

class CategoryProductsRemoteDataSourceImpl
    extends CategoryProductsRemoteDataSource {
  @override
  Future<List<CategoryProductsEntity>> fetchCategoryProducts(
      FetchCategoryProductParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.getAllProductsByCategory(parameters.id));

    return List<CategoryProductsEntity>.from(
      (response.data as List).map(
        (categoryProducts) => CategoryProductsModel.fromJson(categoryProducts),
      ),
    );
  }
}
