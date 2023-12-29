import 'package:ecommerce/core/widgets/custom_elevated_button_widget.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/order/domain/entities/order_product_entity.dart';
import 'package:ecommerce/features/order/presentation/manager/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCheckoutBlocBuilder extends StatelessWidget {
  const ProductsCheckoutBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemEntity>>(
      builder: (context, cartState) {
        final totalItem = context.select((CartCubit cubit) => cubit.totalItem);
        final totalAmount =
            context.select((CartCubit cubit) => cubit.totalAmount);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total ($totalItem item):',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff666666),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(1)}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomElevatedButtonWidget(
              borderRadius: 15,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: () {
                if (totalItem == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your cart is empty'),
                    ),
                  );
                } else {
                  for (var orderIndex = 0;
                      orderIndex < cartState.length;
                      orderIndex++) {
                    context.read<OrderCubit>().addOrder(
                          OrderProductEntity(
                            productType:
                                cartState[orderIndex].product.productType,
                            id: cartState[orderIndex].product.id,
                            name: cartState[orderIndex].product.name,
                            imageUrl: cartState[orderIndex].product.imageUrl,
                            price: cartState[orderIndex].product.price *
                                cartState[orderIndex].quantity,
                            size: cartState[orderIndex].product.size,
                            color: cartState[orderIndex].product.color,
                            quantity: cartState[orderIndex].quantity,
                          ),
                        );
                  }
                  showDialog(
                    barrierDismissible: false,

                    context: context,
                    builder: (context) {
                      return WillPopScope(
                        onWillPop: () async => false,
                        child: AlertDialog(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),

                          title: Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            'Successful!',
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xff666666),
                                ),
                                'You have successfully purchased your cart products!',
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 12),
                                child: CustomElevatedButtonWidget(
                                  buttonText: 'Continue Shopping',
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    context.read<CartCubit>().clearCart();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
