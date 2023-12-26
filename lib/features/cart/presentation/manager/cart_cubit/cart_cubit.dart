import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/domain/entities/product_entity.dart';


class CartCubit extends Cubit<List<CartItemEntity>> {
  CartCubit() : super([]);

  double get totalAmount {
    return state.fold(0.0, (total, item) => total + item.totalPrice);
  }

  int get totalItem {
    return state.fold(0, (total, item) => total + item.quantity);
  }

  void addToCart(ProductEntity product) {
    final existingItem = state.firstWhere(
          (item) => item.product == product,
      orElse: () => CartItemEntity(product: product),
    );

    if (state.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      state.add(CartItemEntity(product: product));
    }

    emit(List.from(state));
  }

  void removeFromCart(ProductEntity product) {
    state.removeWhere((item) => item.product == product);
    emit(List.from(state));
  }

  void incrementQuantity(CartItemEntity item) {
    item.quantity++;
    emit(List.from(state));
  }

  void decrementQuantity(CartItemEntity item) {
    if (item.quantity > 1) {
      item.quantity--;
      emit(List.from(state));
    }
  }
}