import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:equatable/equatable.dart';

part 'check_email_state.dart';

class CheckEmailCubit extends Cubit<CheckEmailState> {
  CheckEmailCubit(this.checkEmailUseCase) : super(CheckEmailInitial());

  final CheckEmailUseCase checkEmailUseCase;

  Future<void> checkEmail({required String email}) async {
    emit(CheckEmailLoading());
    var result = await checkEmailUseCase.call(
      CheckEmailParameters(
        email: email,
      ),
    );

    result.fold(
      (failure) => emit(CheckEmailFailure(failure.message)),
      (checkEmail) => emit(CheckEmailSuccess(checkEmail)),
    );
  }
}
