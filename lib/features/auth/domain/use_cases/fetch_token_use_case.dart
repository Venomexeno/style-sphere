import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/token_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repo.dart';

class FetchTokenUseCase extends UseCase<TokenEntity, LoginEntity> {
  final LoginRepo loginRepo;

  FetchTokenUseCase(this.loginRepo);
  @override
  Future<Either<Failure, TokenEntity>> call(LoginEntity loginEntity) async {
    return await loginRepo.fetchToken();
  }

}
