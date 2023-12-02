import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_details_container.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_details_images.dart';
import 'package:flutter/material.dart';

class ProductDetailsPageBody extends StatelessWidget {
  const ProductDetailsPageBody({
    super.key, required this.productDetails,
  });

  final ProductDetailsEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          ProductDetailsImages(imageUrl: productDetails.imagesEntity[0]),
          Positioned(
            bottom: 0,
            child: ProductDetailsContainer(
              title: productDetails.titleEntity,
              description: productDetails.descriptionEntity,
              price: productDetails.priceEntity,
            ),
          ),
        ],
      ),
    );
  }
}
