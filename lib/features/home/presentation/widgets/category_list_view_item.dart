import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
