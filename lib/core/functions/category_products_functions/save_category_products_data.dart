import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:hive/hive.dart';

void saveCategoryProductsData(
    List<CategoryProductsEntity> category, String boxName) {
  var box = Hive.box<CategoryProductsEntity>(boxName);
  box.addAll(category);
}
