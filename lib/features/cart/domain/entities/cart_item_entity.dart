import 'package:ecommerce/features/cart/domain/entities/cart_product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final CartProductEntity product;
  int quantity = 1;

  CartItemEntity({required this.product, required this.quantity});

  num get totalPrice => quantity * product.price;

  @override
  List<Object?> get props => [
        product,
        quantity,
      ];
}
