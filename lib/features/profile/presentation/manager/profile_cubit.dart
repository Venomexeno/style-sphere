import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:ecommerce/features/profile/domain/use_cases/fetch_profile_use_case.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.fetchProfileUseCase) : super(ProfileInitial());

  final FetchProfileUseCase fetchProfileUseCase;

  Future<void> fetchProfile({required String token}) async {
    emit(ProfileLoading());
    final result =
        await fetchProfileUseCase.call(FetchProfileParameters(token: token));

    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (profile) => emit(ProfileSuccess(profile)),
    );
  }
}
