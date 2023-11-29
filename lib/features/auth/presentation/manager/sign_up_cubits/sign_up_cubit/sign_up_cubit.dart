import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/sign_up_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase signUpUseCase;

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await signUpUseCase.call(
      SignUpParameters(
        name: name,
        password: password,
        email: email,
      ),
    );
    print(result);
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (signUp) => emit(SignUpSuccess(signUp)),
    );
  }
}
