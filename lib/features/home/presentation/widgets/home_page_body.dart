import 'package:ecommerce/core/widgets/custom_search_form_widget.dart';
import 'package:ecommerce/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/banner_list_view.dart';
import 'package:ecommerce/features/home/presentation/widgets/cached_network_image_bloc_builder.dart';
import 'package:ecommerce/features/home/presentation/widgets/new_arrival_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({
    super.key,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 25, top: 15,left: 25),
          sliver: SliverAppBar(
            leading: Builder(
              builder: (context) => GestureDetector(
                onTap: (){
                  BlocProvider.of<CategoriesCubit>(context).fetchCategories();
                  Scaffold.of(context).openDrawer();
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 50.h,
                    height: 50.h,
                  ),
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: const [
              CachedNetworkImageBlocBuilder(),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                ),
                Text(
                  'Our Fashions App',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                      color: const Color(0xff666666)),
                ),
                const SizedBox(height: 10),
                CustomSearchFormWidget(
                  formKey: _formKey,
                ),
                const SizedBox(height: 15),
                const BannerListView(),
                const SizedBox(height: 15),
                Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const NewArrivalGridViewBlocBuilder(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
