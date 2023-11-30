import 'package:ecommerce/features/home/presentation/widgets/category_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
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
          const SizedBox(height: 30),
          Text(
            'Categories',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          const Flexible(
            child: CategoryListViewBlocBuilder(),
          )
        ],
      ),
    );
  }
}

