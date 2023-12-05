import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final num price;
  final String size;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.size,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        price,
        size,
      ];
}
