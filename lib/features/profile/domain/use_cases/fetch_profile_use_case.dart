import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/use_cases/use_case.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:ecommerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:equatable/equatable.dart';

class FetchProfileUseCase
    extends UseCase<ProfileEntity, FetchProfileParameters> {
  final ProfileRepo profileRepo;

  FetchProfileUseCase(this.profileRepo);

  @override
  Future<Either<Failure, ProfileEntity>> call(
      FetchProfileParameters parameters) async {
    return await profileRepo.fetchProfile(parameters);
  }
}

class FetchProfileParameters extends Equatable {
  final String token;

  const FetchProfileParameters({required this.token});

  @override
  List<Object?> get props => [
        token,
      ];
}
