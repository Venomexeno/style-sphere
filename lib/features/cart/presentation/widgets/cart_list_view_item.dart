import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.cartItem,
  });

  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            context
                .read<CartCubit>()
                .removeFromCart(cartItem.product);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16.0),
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: cartItem.product.imageUrl,
                    height: 120.h,
                    width: 120.h,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      cartItem.product.size == 0
                          ? Container()
                          : Text(
                        'Size: ${cartItem.product.size}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff666666),
                        ),
                      ),
                      if (cartItem.product.productType !=
                          'Clothes' ||
                          cartItem.product.productType !=
                              'Shoes') ...[
                        Container()
                      ] else ...[
                        Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff666666),
                              ),
                            ),
                            Container(
                              width: 15.h,
                              height: 15.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                color: cartItem.product.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '\$${cartItem.product.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => context
                                      .read<CartCubit>()
                                      .decrementQuantity(
                                    cartItem,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                                Text(
                                  '${cartItem.quantity}',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                GestureDetector(
                                  onTap: () => context
                                      .read<CartCubit>()
                                      .incrementQuantity(
                                    cartItem,
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
        ),
      ),
    );
  }
}
