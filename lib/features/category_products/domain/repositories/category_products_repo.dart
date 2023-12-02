import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/use_cases/fetch_category_products_use_case.dart';

abstract class CategoryProductsRepo {
  Future<Either<Failure, List<CategoryProductsEntity>>> fetchCategoryProducts(FetchCategoryProductParameters parameters);
}
