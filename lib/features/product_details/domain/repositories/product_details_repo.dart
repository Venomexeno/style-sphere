import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsEntity>> fetchProductDetails(
      FetchProductDetailsParameters parameters);
}
