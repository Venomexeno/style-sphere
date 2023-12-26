import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_list_view_item.dart';
import 'package:flutter/material.dart';

class CartLisView extends StatelessWidget {
  const CartLisView({
    super.key,
    required this.cartItems,
  });

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return CartListViewItem(
          cartItem: cartItems[index],
        );
      },
    );
  }
}
