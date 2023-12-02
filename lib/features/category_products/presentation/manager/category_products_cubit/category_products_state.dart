part of 'category_products_cubit.dart';

abstract class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  final List<CategoryProductsEntity> categoryProducts;

  const CategoryProductsSuccess(this.categoryProducts);
}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsFailure extends CategoryProductsState {
  final String errMessage;

  const CategoryProductsFailure(this.errMessage);
}
