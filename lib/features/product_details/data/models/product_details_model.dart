import 'package:ecommerce/features/product_details/data/models/product_category_model.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  final int id;
  final String title;
  final num price;
  final String description;
  final List<String> images;
  final ProductCategoryModel productCategory;

  const ProductDetailsModel({
    required this.productCategory,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  }) : super(
          productCategoryEntity: productCategory,
          idEntity: id,
          titleEntity: title,
          priceEntity: price,
          descriptionEntity: description,
          imagesEntity: images,
        );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        productCategory: ProductCategoryModel.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
