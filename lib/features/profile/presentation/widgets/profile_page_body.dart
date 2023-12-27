import 'package:ecommerce/features/profile/presentation/widgets/profile_button_row.dart';
import 'package:ecommerce/features/profile/presentation/widgets/user_card_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(right: 20, top: 15, left: 20),
          sliver: SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                UserCardBlocBuilder(),
                const SizedBox(height: 30),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: const Color(0xff666666),
                    ),
                  ),
                  child: Column(
                    children: [
                      ProfileButtonRow(
                        title: 'Personal Details',
                        onPressed: () {},
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 10),
                      ProfileButtonRow(
                        title: 'My Orders',
                        onPressed: () {},
                        icon: Icons.shopping_bag,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

