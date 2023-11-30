import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';

class NewArrivalsModel extends NewArrivalsEntity {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;

  NewArrivalsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
  }) : super(
          idEntity: id!,
          titleEntity: title!,
          priceEntity: price!,
          descriptionEntity: description!,
          imagesEntity: images!,
        );

  factory NewArrivalsModel.fromJson(Map<String, dynamic> json) {
    return NewArrivalsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
  );
  }
}
