import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/sign_up_repositories/sign_up_repo.dart';
import 'package:equatable/equatable.dart';

class SignUpUseCase extends UseCase<SignUpEntity, SignUpParameters> {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  @override
  Future<Either<Failure, SignUpEntity>> call(
      SignUpParameters parameters) async {
    return await signUpRepo.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String name;
  final String password;
  final String email;

  const SignUpParameters({
    required this.name,
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [name, password, email];
}
