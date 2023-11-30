import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/no_param_use_case.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';

class FetchCategoryUseCase extends UseCase<List<CategoryEntity>> {
  final HomeRepo homeRepo;

  FetchCategoryUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await homeRepo.fetchCategories();
  }
}
