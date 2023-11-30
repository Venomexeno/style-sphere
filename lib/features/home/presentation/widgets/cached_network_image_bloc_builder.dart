import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageBlocBuilder extends StatelessWidget {
  const CachedNetworkImageBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return CachedNetworkImage(
            imageUrl: state.userEntity.avatarEntity,
            imageBuilder: (context, imageProvider) => Container(
              width: 60.h,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          );
        } else if (state is UserFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
