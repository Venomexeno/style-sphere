import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param parameters);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
