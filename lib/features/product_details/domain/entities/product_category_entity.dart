import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product_category_entity.g.dart';

@HiveType(typeId: 4)
class ProductCategoryEntity extends Equatable {
  @HiveField(0)
  final int idEntity;
  @HiveField(1)
  final String nameEntity;

  const ProductCategoryEntity({
    required this.idEntity,
    required this.nameEntity,
  });

  @override
  List<Object?> get props => [
        idEntity,
        nameEntity,
      ];
}
