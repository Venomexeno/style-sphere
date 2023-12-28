import 'package:ecommerce/features/home/presentation/widgets/news_arrival_loading_grid_view_item.dart';
import 'package:flutter/material.dart';

class NewsArrivalLoadingGridView extends StatelessWidget {
  const NewsArrivalLoadingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        childAspectRatio: 0.6,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const NewsArrivalLoadingGridViewItem();
      },
    );
  }
}

