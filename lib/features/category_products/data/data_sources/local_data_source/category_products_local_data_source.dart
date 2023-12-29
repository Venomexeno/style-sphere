import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:hive/hive.dart';

abstract class CategoryProductsLocalDataSource {
  List<CategoryProductsEntity> fetchCategoryProducts();
}

class CategoryProductsLocalDataSourceImpl
    extends CategoryProductsLocalDataSource {
  @override
  List<CategoryProductsEntity> fetchCategoryProducts() {
    var box = Hive.box<CategoryProductsEntity>(kCategoryProducts);

    return box.values.toList();
  }
}
