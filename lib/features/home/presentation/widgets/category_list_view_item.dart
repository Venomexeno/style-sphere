import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.categoryEntity,
  });

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, AppRoutes.categoryProductsPageRoute,
            arguments: categoryEntity);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Text(
          categoryEntity.nameEntity,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
