import 'package:ecommerce/features/order/domain/entities/order_product_entity.dart';
import 'package:ecommerce/features/order/presentation/manager/order_cubit.dart';
import 'package:ecommerce/features/order/presentation/widgets/on_going_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGoingListViewBlocBuilder extends StatelessWidget {
  const OnGoingListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, List<OrderProductEntity>>(
      builder: (context, state) {
        if(state.isEmpty)
          {
            return const Center(child: Text('Oops, You didn\'t buy anything yet'),);
          }
        else
          {
            return OnGoingListView(
              orderProducts: state,
            );
          }
      },
    );
  }
}
