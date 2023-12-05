import 'package:ecommerce/features/cart/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, this.quantity = 1});

  num get totalPrice => quantity * product.price;

  @override
  List<Object?> get props => [
        product,
        quantity,
      ];
}
