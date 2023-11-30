import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsGridViewItem extends StatelessWidget {
  const NewArrivalsGridViewItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  final String imageUrl;
  final String name;
  final String description;
  final num price;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                description,
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xff666666)),
              ),
              Text(
                '$price \$',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
