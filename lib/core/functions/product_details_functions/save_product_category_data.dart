import 'package:ecommerce/features/product_details/domain/entities/product_category_entity.dart';
import 'package:hive/hive.dart';

void saveProductCategoryData(
    ProductCategoryEntity productCategory, String boxName) {
  var box = Hive.box<ProductCategoryEntity>(boxName);
  box.add(productCategory);
}
