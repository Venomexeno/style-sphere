import 'package:ecommerce/features/cart/presentation/widgets/cart_page_body.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartPageBody(),
    );
  }
}
