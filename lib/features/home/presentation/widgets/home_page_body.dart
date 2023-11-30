import 'package:ecommerce/core/widgets/custom_search_form_widget.dart';
import 'package:ecommerce/features/home/presentation/widgets/new_arrivals_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({
    super.key,
    required this.token,
  });

  final String token;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 30, top: 15),
          sliver: SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              CachedNetworkImage(
                imageUrl:
                    'https://www.sailmet.com/Content/Images/news/202111/a2b1176f1dda45cb9000980a8edced6a.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
                      color: Color(0xff666666)),
                ),
                const SizedBox(height: 10),
                CustomSearchFormWidget(
                  formKey: _formKey,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: 260,
                          imageUrl:
                              'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnVybml0dXJlJTIwZGVzaWdufGVufDB8fDB8fHww',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: 4,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const NewArrivalsGridViewBlocBuilder(),
              ],
            ),
          ),
        )
      ],
    );
  }
}


