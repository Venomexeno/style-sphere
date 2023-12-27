import 'package:ecommerce/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListViewBlocBuilder extends StatelessWidget {
  const CategoryListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return  CategoryListView(
            categoryEntity: state.category,
          );
        } else if (state is CategoriesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
