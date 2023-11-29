import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases/fetch_token_use_case.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.tokenUseCase) : super(LoginInitial());

  final FetchTokenUseCase tokenUseCase;

  Future<void> fetchToken({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await tokenUseCase.call(
      LoginParameters(
        email: email,
        password: password,
      ),
    );

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (token) {
      emit(LoginSuccess(token));
    });
  }
}
