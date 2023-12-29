import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:hive/hive.dart';

abstract class ProductDetailsLocalDataSource {
  ProductDetailsEntity fetchProductDetails();
}

class ProductDetailsLocalDataSourceImpl extends ProductDetailsLocalDataSource {
  @override
  ProductDetailsEntity fetchProductDetails() {

    var box = Hive.box<ProductDetailsEntity>(kProductDetails);
    return box.values.single;
  }
}
