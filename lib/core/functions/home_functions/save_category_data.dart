import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:hive/hive.dart';

void saveCategoryData(List<CategoryEntity> category, String boxName) {
  var box = Hive.box<CategoryEntity>(boxName);
  box.addAll(category);
}