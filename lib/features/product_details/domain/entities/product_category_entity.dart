import 'package:equatable/equatable.dart';

class ProductCategoryEntity extends Equatable {
  final int idEntity;
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
