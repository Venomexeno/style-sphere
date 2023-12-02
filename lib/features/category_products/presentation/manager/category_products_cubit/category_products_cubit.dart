import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/category_products/domain/use_cases/fetch_category_products_use_case.dart';
import 'package:equatable/equatable.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.fetchCategoryProductsUseCase)
      : super(CategoryProductsInitial());

  final FetchCategoryProductsUseCase fetchCategoryProductsUseCase;

  Future<void> fetchCategoryProducts({required int id}) async {
    emit(CategoryProductsLoading());
    final result = await fetchCategoryProductsUseCase
        .call(FetchCategoryProductParameters(id: id));

    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.message)),
      (categoryProducts) => emit(CategoryProductsSuccess(categoryProducts)),
    );
  }
}
