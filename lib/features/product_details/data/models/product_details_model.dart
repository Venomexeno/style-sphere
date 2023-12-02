import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;

  const ProductDetailsModel({
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

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
