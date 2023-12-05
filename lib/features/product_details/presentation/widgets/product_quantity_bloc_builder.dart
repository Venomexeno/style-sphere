import 'package:ecommerce/features/product_details/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantityBlocBuilder extends StatelessWidget {
  const ProductQuantityBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductQuantityCubit, ProductQuantityState>(
      builder: (context, state) {
        int quantity = 1;
        if (state is ProductQuantityInitial) {
          quantity = state.quantity;
        } else if (state is ProductQuantityLoaded) {
          quantity = state.quantity;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () =>
                  context.read<ProductQuantityCubit>().decrementQuantity(),
              child: const Icon(
                Icons.remove,
              ),
            ),
            Text(
              '$quantity',
              style: TextStyle(fontSize: 16.sp),
            ),
            GestureDetector(
              onTap: () =>
                  context.read<ProductQuantityCubit>().incrementQuantity(),
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        );
      },
    );
  }
}
