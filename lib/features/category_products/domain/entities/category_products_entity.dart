import 'package:equatable/equatable.dart';

class CategoryProductsEntity extends Equatable {
  final int idEntity;
  final String titleEntity;
  final int priceEntity;
  final String descriptionEntity;
  final List<String> imagesEntity;

  const CategoryProductsEntity({
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
        imagesEntity,
      ];
}
