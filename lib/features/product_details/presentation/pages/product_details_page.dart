import 'package:ecommerce/features/product_details/presentation/widgets/product_details_page_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 10, top: 15, left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
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
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/icons/cart.svg',
                    width: 45.h,
                    height: 45.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const ProductDetailsPageBodyBlocBuilder(),
    );
  }
}

