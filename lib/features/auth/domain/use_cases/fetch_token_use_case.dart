import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repo.dart';
import 'package:equatable/equatable.dart';

class FetchTokenUseCase extends UseCase<TokenEntity, LoginParameters> {
  final LoginRepo loginRepo;

  FetchTokenUseCase(this.loginRepo);

  @override
  Future<Either<Failure, TokenEntity>> call(LoginParameters parameters) async {
    return await loginRepo.fetchToken(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
