import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cart_cubit/cart_cubit.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemEntity>>(
      builder: (context, cartState) {
        print("CartPageBody - CartState: ${cartState}");
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartState.length,
                itemBuilder: (context, index) {
                  final item = cartState[index];
                  return Dismissible(
                    key: Key('${item.product.id}'), // Use a unique identifier for the key
                    onDismissed: (direction) {
                      context.read<CartCubit>().removeFromCart(item.product);
                    },
                    background: Container(
                      color: Colors.red, // Background color when swiping
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: CartItemWidget(item: item),
                  );
                },
              ),
            ),
            const TotalAmountWidget(),
          ],
        );
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItemEntity item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item.product.imageUrl),
      title: Text(item.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quantity: ${item.quantity}'),
          Text('Total Price: \$${item.totalPrice.toStringAsFixed(2)}'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              context.read<CartCubit>().decrementQuantity(item);
            },
          ),
          Text(item.quantity.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.read<CartCubit>().incrementQuantity(item);

            },
          ),
        ],
      ),
    );
  }
}

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final totalAmount = context.select((CartCubit cubit) => cubit.totalAmount);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}