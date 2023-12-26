import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final num price;
  final dynamic size;
  final Color color;
  final String productType;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.color,
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
      ];
}
