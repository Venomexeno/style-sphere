import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListViewBlocBuilder extends StatelessWidget {
  const CartListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemEntity>>(
      builder: (context, cartState) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CartLisView(
                cartItems: cartState,
              ),
            ],
          ),
        );
      },
    );
  }
}
