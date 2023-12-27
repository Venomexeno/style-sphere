import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_user_use_case.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewArrivalsEntity>>> fetchNewArrivals();

  Future<Either<Failure, UserEntity>> fetchUser(FetchUserParameters parameters);

  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();

}
