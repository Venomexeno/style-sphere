import 'package:ecommerce/features/order/presentation/widgets/on_going_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/features/order/domain/entities/order_product_entity.dart';

class OnGoingListView extends StatelessWidget {
  const OnGoingListView({
    super.key,
    required this.orderProducts,
  });

  final List<OrderProductEntity> orderProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderProducts.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return OnGoingListViewItem(
          orderProduct: orderProducts[index],
        );
      },
    );
  }
}
