import 'package:ecommerce/features/home/presentation/widgets/banner_list_view_item.dart';
import 'package:flutter/material.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const BannerListViewItem();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: 4,
      ),
    );
  }
}
