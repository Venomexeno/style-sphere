import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_user_use_case.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.fetchUserUseCase) : super(UserInitial());

  final FetchUserUseCase fetchUserUseCase;

  Future<void> fetchUser({required String token}) async {
    emit(UserLoading());
    var result = await fetchUserUseCase.call(
      FetchUserParameter(token: token),
    );
    result.fold(
      (failure) => emit(UserFailure(failure.message)),
      (user) => emit(UserSuccess(user)),
    );
  }
}
