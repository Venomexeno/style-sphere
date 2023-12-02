import 'package:ecommerce/features/category_products/presentation/widgets/category_products_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryProductsPageBody extends StatelessWidget {
  const CategoryProductsPageBody({
    super.key,
    required this.categoryTitle,
  });

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 25, top: 15, left: 25),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                  width: 50.h,
                  height: 50.h,
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryTitle,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CategoryProductsGridViewBlocBuilder(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
