import 'dart:ui';

import 'package:equatable/equatable.dart';

class OrderProductEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final num price;
  final dynamic size;
  final Color color;
  final int quantity;
  final String productType;

  const OrderProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity,
    required this.productType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        price,
        size,
        color,
        quantity,
        productType,
      ];
}
