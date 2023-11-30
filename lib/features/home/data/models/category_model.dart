import 'package:ecommerce/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final int id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  }) : super(
          idEntity: id,
          nameEntity: name,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
      );
}
