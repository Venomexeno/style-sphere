import 'package:ecommerce/features/product_details/presentation/widgets/product_details_container.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_details_images.dart';
import 'package:flutter/material.dart';

class ProductDetailsPageBody extends StatelessWidget {
  const ProductDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          ProductDetailsImages(),
          Positioned(
            bottom: 0,
            child: ProductDetailsContainer(),
          ),
        ],
      ),
    );
  }
}


