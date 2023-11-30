import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/new_arrivals_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalsGridViewBlocBuilder extends StatelessWidget {
  const NewArrivalsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
      builder: (context, state) {
        if (state is NewArrivalsSuccess) {
          return NewArrivalsGridView(
            newArrivalsEntity: state.newArrivals,
          );
        } else if (state is NewArrivalsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
