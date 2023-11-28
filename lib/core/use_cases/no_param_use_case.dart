import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
