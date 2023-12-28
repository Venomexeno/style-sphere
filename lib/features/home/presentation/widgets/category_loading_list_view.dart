import 'package:ecommerce/features/home/presentation/widgets/category_loading_list_view_item.dart';
import 'package:flutter/material.dart';

class CategoryLoadingListView extends StatelessWidget {
  const CategoryLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryLoadingListViewItem();
      },
    );
  }
}

