import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/home/presentation/widgets/new_arrivals_grid_view_item.dart';
import 'package:flutter/material.dart';

class NewArrivalsGridView extends StatelessWidget {
  const NewArrivalsGridView({
    super.key,
    required this.newArrivalsEntity,
  });

  final List<NewArrivalsEntity> newArrivalsEntity;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: newArrivalsEntity.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        childAspectRatio: 130 / 200,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return NewArrivalsGridViewItem(
          imageUrl: newArrivalsEntity[index].imagesEntity[0],
          price: newArrivalsEntity[index].priceEntity,
          name: newArrivalsEntity[index].titleEntity,
          description: newArrivalsEntity[index].descriptionEntity,

        );
      },
    );
  }
}
