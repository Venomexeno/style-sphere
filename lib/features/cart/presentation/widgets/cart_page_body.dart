import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_list_view_bloc_builder.dart';
import 'package:ecommerce/features/cart/presentation/widgets/products_checkout_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 20, top: 15, left: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                  width: 50.h,
                  height: 50.h,
                ),
              ),
            ),
            actions: [
              Stack(
                children: [
                  UnconstrainedBox(
                    child: SvgPicture.asset(
                      'assets/icons/cart.svg',
                      width: 45.h,
                      height: 45.h,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BlocBuilder<CartCubit, List<CartItemEntity>>(
                      builder: (context, state) {
                        if (state.isEmpty) {
                          return Container();
                        } else {
                          return Container(
                            width: 22.h,
                            height: 22.h,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${state.length}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        const SliverToBoxAdapter(
          child: CartListViewBlocBuilder(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: false,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Container(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ProductsCheckoutBlocBuilder(),
              ),
            ],
          ),
        )
      ],
    );
  }
}


