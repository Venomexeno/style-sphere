import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_quantity_state.dart';

class ProductQuantityCubit extends Cubit<ProductQuantityState> {
  int _quantity = 1;

  ProductQuantityCubit() : super(const ProductQuantityInitial(quantity: 1));

  void incrementQuantity() {
    _quantity++;
    emit(ProductQuantityLoaded(quantity: _quantity));
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      emit(ProductQuantityLoaded(quantity: _quantity));
    }
  }
}
