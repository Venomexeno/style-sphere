import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/features/home/data/models/new_arrivals_model.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewArrivalsEntity>> fetchNewArrivals();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  @override
  // Future<List<NewArrivalsEntity>> fetchNewArrivals() async {
  //   var data = await apiService.get(endPoint: 'products?offset=0&limit=10');
  //   print('Data is $data');
  //   List<NewArrivalsEntity> newArrivals = [];
  //   for (var newArrivalsMap in data['']) {
  //     newArrivals.add(NewArrivalsModel.fromJson(newArrivalsMap as dynamic));
  //   }
  //   return newArrivals;
  // }
  Future<List<NewArrivalsEntity>> fetchNewArrivals() async {
    final response =
        await Dio().get(ApiConstants.getFirst10Products);
    return List<NewArrivalsEntity>.from(
      (response.data as List).map(
        (newArrivals) => NewArrivalsModel.fromJson(newArrivals),
      ),
    );
  }
}
