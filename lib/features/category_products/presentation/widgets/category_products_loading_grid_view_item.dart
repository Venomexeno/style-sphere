import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductsLoadingGridViewItem extends StatelessWidget {
  const CategoryProductsLoadingGridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          return Column(
            children: [
              Container(
                height: height * 0.68,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              const Spacer(),
              Container(
                width: width,
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: width,
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: width * 0.5,
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
