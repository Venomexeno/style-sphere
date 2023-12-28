import 'package:ecommerce/features/order/presentation/widgets/order_page_body.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderPageBody(),
    );
  }
}
