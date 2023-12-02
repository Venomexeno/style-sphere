import 'package:ecommerce/core/widgets/custom_column_show_product.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:flutter/material.dart';

class CategoryProductsGridView extends StatelessWidget {
  const CategoryProductsGridView({
    super.key,
    required this.categoryProducts,
  });

  final List<CategoryProductsEntity> categoryProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      itemCount: categoryProducts.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        childAspectRatio: 0.6,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CustomColumnShowProduct(
          imageUrl: categoryProducts[index].imagesEntity[0],
          price: categoryProducts[index].priceEntity,
          name: categoryProducts[index].titleEntity,
          description: categoryProducts[index].descriptionEntity,
        );
      },
    );
  }
}
