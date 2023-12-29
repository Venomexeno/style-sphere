import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';


abstract class HomeLocalDataSource
{
  List<NewArrivalsEntity> fetchNewArrivals();


  List<CategoryEntity> fetchCategories();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<CategoryEntity> fetchCategories() {
    var box = Hive.box<CategoryEntity>(kCategory);

    return box.values.toList();
  }

  @override
  List<NewArrivalsEntity> fetchNewArrivals() {
   var box = Hive.box<NewArrivalsEntity>(kNewArrivals);

   return box.values.toList();
  }

}