import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.fetchCategoryUseCase) : super(CategoriesInitial());

  final FetchCategoryUseCase fetchCategoryUseCase;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await fetchCategoryUseCase.call();

    result.fold(
      (failure) => emit(CategoriesFailure(failure.message)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
