import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_list_view_item.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categoryEntity
  });

  final List<CategoryEntity> categoryEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: categoryEntity.length,
      itemBuilder: (context, index) {
        return  CategoryListViewItem(
          name:categoryEntity[index].nameEntity,
          id:categoryEntity[index].idEntity,
        );
      },

    );
  }
}

