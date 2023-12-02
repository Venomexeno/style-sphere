import 'package:ecommerce/features/category_products/presentation/widgets/category_products_page_body.dart';
import 'package:flutter/material.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    super.key,
    required this.categoryTitle,
  });

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryProductsPageBody(
        categoryTitle: categoryTitle,
      ),
    );
  }
}
