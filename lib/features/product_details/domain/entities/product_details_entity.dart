import 'package:ecommerce/features/product_details/domain/entities/product_category_entity.dart';
import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final int idEntity;
  final String titleEntity;
  final num priceEntity;
  final String descriptionEntity;
  final ProductCategoryEntity productCategoryEntity;
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
