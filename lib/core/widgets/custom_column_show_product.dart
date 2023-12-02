import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColumnShowProduct extends StatelessWidget {
  const CustomColumnShowProduct({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.id,
  });

  final String imageUrl;
  final String name;
  final String description;
  final num price;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetailsPageRoute,
            arguments: id);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          return SizedBox(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    height: height * 0.68,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    imageUrl: imageUrl,
                  ),
                ),
                const Spacer(),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff666666)),
                ),
                Text(
                  '$price \$',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
