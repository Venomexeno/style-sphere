import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/settings/domain/entities/update_user_entity.dart';
import 'package:ecommerce/features/settings/domain/use_cases/update_user_use_case.dart';
import 'package:equatable/equatable.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.updateUserUseCase) : super(UpdateUserInitial());

  final UpdateUserUseCase updateUserUseCase;

  Future<void> updateUser({
    required String name,
    required String email,
    required String password,
    required int id,
  }) async {
    emit(UpdateUserLoading());
    final result = await updateUserUseCase.call(
      UpdateUserParameters(
        id: id,
        name: name,
        email: email,
        password: password,
      ),
    );
    result.fold(
      (failure) {
        emit(UpdateUserFailure(errMessage: failure.message));
      },
      (updateUser) => emit(UpdateUserSuccess(updateUser: updateUser)),
    );
  }
}
