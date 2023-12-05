import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemEntity>>(
      builder: (context, cartState) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartState.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Dismissible(
                          key: Key(
                              '${cartState[index].product.id}${cartState[index].product.size}'),
                          // Use a unique identifier for the key
                          onDismissed: (direction) {
                            context
                                .read<CartCubit>()
                                .removeFromCart(cartState[index].product);
                          },
                          background: Container(
                            color: Colors.red, // Background color when swiping
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 120.h,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            cartState[index].product.imageUrl,
                                        height: 120.h,
                                        width: 120.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartState[index].product.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Text(
                                            'Size: ${cartState[index].product.size}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff666666),
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                '\$${cartState[index].product.price}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                width: 80.w,
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => context
                                                          .read<CartCubit>()
                                                          .decrementQuantity(
                                                            cartState[index],
                                                          ),
                                                      child: const Icon(
                                                        Icons.remove,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${cartState[index].quantity}',
                                                      style: TextStyle(
                                                          fontSize: 14.sp),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => context
                                                          .read<CartCubit>()
                                                          .incrementQuantity(
                                                            cartState[index],
                                                          ),
                                                      child: const Icon(
                                                        Icons.add,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              index == cartState.length - 1
                                  ? Container()
                                  : const Divider(thickness: 1),
                            ],
                          ),
                          // CartItemWidget(item: item),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const TotalAmountWidget(),
            ],
          ),
        );
      },
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
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
