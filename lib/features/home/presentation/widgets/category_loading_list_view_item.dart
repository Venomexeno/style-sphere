import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingListViewItem extends StatelessWidget {
  const CategoryLoadingListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color:  Colors.grey[300]!,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
      ),
    );
  }
}
