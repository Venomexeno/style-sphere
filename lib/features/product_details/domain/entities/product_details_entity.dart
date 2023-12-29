import 'package:ecommerce/features/product_details/domain/entities/product_category_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product_details_entity.g.dart';

@HiveType(typeId: 3)
class ProductDetailsEntity extends Equatable {
  @HiveField(0)
  final int idEntity;
  @HiveField(1)
  final String titleEntity;
  @HiveField(2)
  final num priceEntity;
  @HiveField(3)
  final String descriptionEntity;
  @HiveField(4)
  final ProductCategoryEntity productCategoryEntity;
  @HiveField(5)
  final List<String> imagesEntity;

  const ProductDetailsEntity({
    required this.productCategoryEntity,
    required this.idEntity,
    required this.titleEntity,
    required this.priceEntity,
    required this.descriptionEntity,
    required this.imagesEntity,
  });

  @override
  List<Object?> get props => [
        idEntity,
        titleEntity,
        priceEntity,
        descriptionEntity,
        productCategoryEntity,
        imagesEntity,
      ];
}
