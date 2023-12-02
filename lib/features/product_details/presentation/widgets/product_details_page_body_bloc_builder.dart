import 'package:ecommerce/features/product_details/presentation/manager/fetch_product_details_cubit/fetch_product_details_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_details_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPageBodyBlocBuilder extends StatelessWidget {
  const ProductDetailsPageBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductDetailsCubit, FetchProductDetailsState>(
      builder: (context, state) {
        if (state is FetchProductDetailsSuccess) {
          return ProductDetailsPageBody(
            productDetails: state.productDetails,
          );
        } else if (state is FetchProductDetailsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
