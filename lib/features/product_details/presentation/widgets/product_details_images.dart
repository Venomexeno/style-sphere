import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsImages extends StatelessWidget {
  const ProductDetailsImages({
    super.key, required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.515,
      fit: BoxFit.fill,
    );
  }
}
