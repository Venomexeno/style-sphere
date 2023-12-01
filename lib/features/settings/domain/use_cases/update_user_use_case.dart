import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';
import 'package:ecommerce/features/settings/domain/repositories/settings_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUserUseCase
    extends UseCase<UpdateUserEntity, UpdateUserParameters> {
  final SettingsRepo settingsRepo;

  UpdateUserUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, UpdateUserEntity>> call(
      UpdateUserParameters parameters) async {
    return await settingsRepo.updateUser(parameters);
  }
}

class UpdateUserParameters extends Equatable {
  final int id;
  final String name;
  final String email;
  final String password;

  const UpdateUserParameters({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [
        id,
        name,
        email,
        password,
      ];
}
