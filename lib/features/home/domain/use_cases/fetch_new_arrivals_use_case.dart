import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/no_param_use_case.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';

class FetchNewArrivalsUseCase extends UseCase<List<NewArrivalsEntity>> {
  final HomeRepo homeRepo;

  FetchNewArrivalsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<NewArrivalsEntity>>> call() async {
    return await homeRepo.fetchNewArrivals();
  }
}
