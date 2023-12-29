import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:hive/hive.dart';

void saveNewArrivalsData(List<NewArrivalsEntity> newArrivals, String boxName) {
  var box = Hive.box<NewArrivalsEntity>(boxName);
  box.addAll(newArrivals);
}
