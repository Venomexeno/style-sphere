import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_user_use_case.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<NewArrivalsEntity>>> fetchNewArrivals() async {
    try {
      var newArrivals = await homeRemoteDataSource.fetchNewArrivals();
      return right(newArrivals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUser(
      FetchUserParameters parameters) async {
    try {
      var user = await homeRemoteDataSource.fetchUser(parameters);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      var categories = await homeRemoteDataSource.fetchCategories();
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
