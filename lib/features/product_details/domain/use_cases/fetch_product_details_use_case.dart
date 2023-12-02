import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:equatable/equatable.dart';

class FetchProductDetailsUseCase
    extends UseCase<ProductDetailsEntity, FetchProductDetailsParameters> {
  final ProductDetailsRepo productDetailsRepo;

  FetchProductDetailsUseCase(this.productDetailsRepo);

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(
      FetchProductDetailsParameters parameters) async {
    return await productDetailsRepo.fetchProductDetails(parameters);
  }
}

class FetchProductDetailsParameters extends Equatable {
  final int id;

  const FetchProductDetailsParameters({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
