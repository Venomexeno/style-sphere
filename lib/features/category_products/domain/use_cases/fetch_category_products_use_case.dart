import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/repositories/category_products_repo.dart';
import 'package:equatable/equatable.dart';

class FetchCategoryProductsUseCase
    extends UseCase<List<CategoryProductsEntity>, FetchCategoryProductParameters> {
  final CategoryProductsRepo categoryProductsRepo;

  FetchCategoryProductsUseCase(this.categoryProductsRepo);

  @override
  Future<Either<Failure, List<CategoryProductsEntity>>> call(
      FetchCategoryProductParameters parameters) async {
    return await categoryProductsRepo.fetchCategoryProducts(parameters);
  }
}

class FetchCategoryProductParameters extends Equatable {
  final int id;

  const FetchCategoryProductParameters({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
