import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/core/widgets/custom_column_show_product.dart';
import 'package:flutter/material.dart';

class NewArrivalGridView extends StatelessWidget {
  const NewArrivalGridView({
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
        childAspectRatio: 0.6,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CustomColumnShowProduct(
          imageUrl: newArrivalsEntity[index].imagesEntity[0],
          price: newArrivalsEntity[index].priceEntity,
          name: newArrivalsEntity[index].titleEntity,
          description: newArrivalsEntity[index].descriptionEntity,

        );
      },
    );
  }
}
