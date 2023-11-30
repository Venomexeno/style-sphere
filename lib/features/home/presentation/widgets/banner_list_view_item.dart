import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerListViewItem extends StatelessWidget {
  const BannerListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: 260,
        imageUrl:
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnVybml0dXJlJTIwZGVzaWdufGVufDB8fDB8fHww',
      ),
    );
  }
}
