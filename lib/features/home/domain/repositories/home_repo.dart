import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewArrivalsEntity>>> fetchNewArrivals();
}
