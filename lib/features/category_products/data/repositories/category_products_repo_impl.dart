import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/category_products/data/data_sources/remote_data_source/category_products_remote_data_source.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/repositories/category_products_repo.dart';
import 'package:ecommerce/features/category_products/domain/use_cases/fetch_category_products_use_case.dart';

class CategoryProductsRepoImpl extends CategoryProductsRepo {
  final CategoryProductsRemoteDataSource categoryProductsRemoteDataSource;

  CategoryProductsRepoImpl(this.categoryProductsRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryProductsEntity>>> fetchCategoryProducts(
      FetchCategoryProductParameters parameters) async{
    try {
      var categoryProducts = await categoryProductsRemoteDataSource.fetchCategoryProducts(parameters);
      return right(categoryProducts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
