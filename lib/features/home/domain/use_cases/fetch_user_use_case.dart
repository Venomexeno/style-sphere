import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

class FetchUserUseCase extends UseCase<UserEntity, FetchUserParameters> {
  final HomeRepo homeRepo;

  FetchUserUseCase(this.homeRepo);

  @override
  Future<Either<Failure, UserEntity>> call(
      FetchUserParameters parameters) async {
    return await homeRepo.fetchUser(parameters);
  }
}

class FetchUserParameters extends Equatable {
  final String token;

  const FetchUserParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
      ];
}
