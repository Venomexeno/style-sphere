import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';
import 'package:equatable/equatable.dart';

part 'fetch_product_details_state.dart';

class FetchProductDetailsCubit extends Cubit<FetchProductDetailsState> {
  FetchProductDetailsCubit(this.fetchProductDetailsUseCase)
      : super(FetchProductDetailsInitial());

  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  Future<void> fetchProductDetails({required int id}) async {
    emit(FetchProductDetailsLoading());
    final result = await fetchProductDetailsUseCase
        .call(FetchProductDetailsParameters(id: id));
    result.fold(
      (failure) => FetchProductDetailsFailure(failure.message),
      (productDetails) => emit(FetchProductDetailsSuccess(productDetails)),
    );
  }
}
