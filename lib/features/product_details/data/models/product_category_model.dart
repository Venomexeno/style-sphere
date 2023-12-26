import 'package:ecommerce/features/product_details/domain/entities/product_category_entity.dart';

class ProductCategoryModel extends ProductCategoryEntity {
  final int id;
  final String name;

  const ProductCategoryModel({
    required this.id,
    required this.name,
  }) : super(idEntity: id, nameEntity: name);

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
    id: json["id"],
    name: json["name"],
  );
}


