part of 'product_quantity_cubit.dart';

abstract class ProductQuantityState extends Equatable {
  const ProductQuantityState();

  @override
  List<Object> get props => [];
}

class ProductQuantityInitial extends ProductQuantityState {
  final int quantity;

  const ProductQuantityInitial({required this.quantity});

  @override
  List<Object> get props => [quantity];
}
class ProductQuantityLoaded extends ProductQuantityState {
  final int quantity;

  const ProductQuantityLoaded({required this.quantity});

  @override
  List<Object> get props => [quantity];
}

