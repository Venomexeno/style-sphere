import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_new_arrivals_use_case.dart';
import 'package:equatable/equatable.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit(this.fetchNewArrivalsUseCase) : super(NewArrivalsInitial());

  final FetchNewArrivalsUseCase fetchNewArrivalsUseCase;

  Future<void> fetchNewArrivals() async {
    emit(NewArrivalsLoading());
    var result = await fetchNewArrivalsUseCase.call();

    result.fold(
      (failure) => emit(NewArrivalsFailure(failure.message)),
      (newArrivals) => emit(NewArrivalsSuccess(newArrivals)),
    );
  }
}
