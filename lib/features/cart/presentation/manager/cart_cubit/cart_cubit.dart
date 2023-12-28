import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product_entity.dart';

class CartCubit extends Cubit<List<CartItemEntity>> {
  CartCubit() : super([]);

  double get totalAmount {
    return state.fold(0.0, (total, item) => total + item.totalPrice);
  }

  int get totalItem {
    return state.fold(0, (total, item) => total + item.quantity);
  }

  void addToCart({required CartProductEntity product, required int quantity}) {
    final existingItem = state.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItemEntity(product: product, quantity: quantity),
    );

    if (state.contains(existingItem)) {
      existingItem.quantity += quantity;
    } else {
      state.add(CartItemEntity(product: product, quantity: quantity));
    }

    emit(List.from(state));
  }

  void removeFromCart(CartProductEntity product) {
    state.removeWhere((item) => item.product == product);
    emit(List.from(state));
  }

  void clearCart() {
    state.clear();
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
