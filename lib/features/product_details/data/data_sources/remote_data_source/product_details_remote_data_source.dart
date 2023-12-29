import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/core/functions/product_details_functions/save_product_category_data.dart';
import 'package:ecommerce/core/functions/product_details_functions/save_product_details_data.dart';
import 'package:ecommerce/features/product_details/data/models/product_details_model.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsEntity> fetchProductDetails(
      FetchProductDetailsParameters parameters);
}

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSource {
  @override
  Future<ProductDetailsEntity> fetchProductDetails(
      FetchProductDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.getSingleProduct(parameters.id));
    var productDetails = ProductDetailsModel.fromJson(response.data);

    saveProductCategoryData(
        productDetails.productCategoryEntity, kProductCategory);

    saveProductDetailsData(productDetails, kProductDetails);

    return productDetails;
  }
}
