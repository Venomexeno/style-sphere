import 'package:ecommerce/core/widgets/custom_elevated_button_widget.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_size_selector_cubit/product_size_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_size_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  final String title;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 90.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: ProductQuantityBlocBuilder(),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Available in stock',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Size',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const ProductSizeSelector(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xffAAAAAA)),
                          ),
                          Text(
                            '\$$price',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Flexible(
                        child: CustomElevatedButtonWidget(
                          onPressed: () {
                            final selectedSize =
                                context.read<ProductSizeSelectorCubit>().state;
                            print(selectedSize);
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_bag_outlined),
                              const SizedBox(width: 10),
                              Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
