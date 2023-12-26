import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  final List<Widget> screens;
  final List<String> screenNames;
  final NavigationCubit cubit;
  final List<IconData> icons;

  const BottomNavigationBarScreen({
    super.key,
    required this.screens,
    required this.screenNames,
    required this.cubit,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationCubitState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[
              state is NavigationIndexChangedState ? state.selectedIndex : 0],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex:
                state is NavigationIndexChangedState ? state.selectedIndex : 0,
            onTap: (index) {
              cubit.navigateTo(index);
            },
            items: List.generate(
              screens.length,
              (index) => BottomNavigationBarItem(
                label: "",
                icon: Container(
                  padding: EdgeInsets.only(left: 14.w),
                  child: _buildIcon(index, state),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon(int index, NavigationCubitState state) {
    bool isSelected =
        state is NavigationIndexChangedState && state.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          cubit.navigateTo(index);
        }
      },
      child: Row(
        children: [
          Container(
            height: 36.h,
            width: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black : null,
            ),
            child: Center(
              child: Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 45.w,
              height: 30.h,
              padding: EdgeInsets.all(2.r),
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  screenNames[index],
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style:  TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
