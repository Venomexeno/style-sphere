import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';

class CategoryProductsModel extends CategoryProductsEntity {
  final int id;
  final String title;
  final num price;
  final String description;
  final List<String> images;

  const CategoryProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  }) : super(
          idEntity: id,
          titleEntity: title,
          priceEntity: price,
          descriptionEntity: description,
          imagesEntity: images,
        );

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((image) => image)),
      );
}
