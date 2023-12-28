import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/new_arrival_grid_view.dart';
import 'package:ecommerce/features/home/presentation/widgets/news_arrival_loading_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalGridViewBlocBuilder extends StatelessWidget {
  const NewArrivalGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
      builder: (context, state) {
        if (state is NewArrivalsSuccess) {
          return NewArrivalGridView(
            newArrivalsEntity: state.newArrivals,
          );
        } else if (state is NewArrivalsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return NewsArrivalLoadingGridView();
        }
      },
    );
  }
}

