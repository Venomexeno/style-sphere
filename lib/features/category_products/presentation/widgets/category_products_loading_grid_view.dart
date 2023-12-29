import 'package:ecommerce/features/category_products/presentation/widgets/category_products_loading_grid_view_item.dart';
import 'package:flutter/material.dart';

class CategoryProductsLoadingGridView extends StatelessWidget {
  const CategoryProductsLoadingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        childAspectRatio: 0.6,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const CategoryProductsLoadingGridViewItem();
      },
    );
  }
}
