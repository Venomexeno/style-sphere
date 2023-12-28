import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/order/domain/entities/order_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnGoingListViewItem extends StatelessWidget {
  const OnGoingListViewItem({
    super.key,
    required this.orderProduct,
  });

  final OrderProductEntity orderProduct;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: 160.h,
          child: Card(
            elevation: 2,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      imageUrl: orderProduct.imageUrl,
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
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      orderProduct.name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Quantity: ${orderProduct.quantity}',
                                      style: const TextStyle(
                                        color: Color(0xff666666),
                                      ),
                                    ),
                                    orderProduct.size == 0
                                        ? Container()
                                        : Text(
                                            'Size: ${orderProduct.size}',
                                            style: const TextStyle(
                                              color: Color(0xff666666),
                                            ),
                                          ),
                                    if (orderProduct.productType == 'Clothes' ||
                                        orderProduct.productType ==
                                            'Shoes') ...[
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
                                              border: Border.all(
                                                  color: Colors.black26),
                                              color: orderProduct.color,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ] else ...[
                                      Container(),
                                    ],
                                  ],
                                ),
                              ),
                              Text(
                                '\$${orderProduct.price}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
