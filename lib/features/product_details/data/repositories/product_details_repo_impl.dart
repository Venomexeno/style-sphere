import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/product_details/data/data_sources/remote_data_source/product_details_remote_data_source.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:ecommerce/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepoImpl(this.productDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> fetchProductDetails(
      FetchProductDetailsParameters parameters) async {
    try {
      var productDetails =
          await productDetailsRemoteDataSource.fetchProductDetails(parameters);
      return right(productDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
