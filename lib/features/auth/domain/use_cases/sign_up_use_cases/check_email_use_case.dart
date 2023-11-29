import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/sign_up_repositories/sign_up_repo.dart';
import 'package:equatable/equatable.dart';

class CheckEmailUseCase
    extends UseCase<CheckEmailEntity, CheckEmailParameters> {
  final SignUpRepo signUpRepo;

  CheckEmailUseCase(this.signUpRepo);

  @override
  Future<Either<Failure, CheckEmailEntity>> call(
      CheckEmailParameters parameters) async {
    return await signUpRepo.checkEmail(parameters);
  }
}

class CheckEmailParameters extends Equatable {
  final String email;

  const CheckEmailParameters({required this.email});

  @override
  List<Object?> get props => [
        email,
      ];
}
