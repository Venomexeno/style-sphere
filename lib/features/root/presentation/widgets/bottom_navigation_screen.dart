import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:ecommerce/features/root/presentation/widgets/bottom_navigation_button.dart';
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
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state,
                  onTap: (index) {
                    cubit.navigateTo(index);
                  },
                  items: List.generate(
                    screens.length,
                    (index) => BottomNavigationBarItem(
                      label: "",
                      icon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 26.w),
                        child: BottomNavigationButton(
                          cubit: cubit,
                          icons: icons,
                          screenNames: screenNames,
                          index: index,
                          state: state,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

