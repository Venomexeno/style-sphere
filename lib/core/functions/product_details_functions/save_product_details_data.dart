import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:hive/hive.dart';

void saveProductDetailsData(
    ProductDetailsEntity productDetails, String boxName) {
  var box = Hive.box<ProductDetailsEntity>(boxName);
  box.add(productDetails);
}
