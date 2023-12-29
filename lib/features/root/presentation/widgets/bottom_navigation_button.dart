import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.cubit,
    required this.icons,
    required this.screenNames,
    required this.index,
    required this.state,
  });

  final NavigationCubit cubit;
  final List<IconData> icons;
  final List<String> screenNames;
  final int index;
  final int state;

  @override
  Widget build(BuildContext context) {
    bool isSelected = state == index;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          cubit.navigateTo(index);
        }
      },
      child: Row(
        children: [
          Container(
            height: isSelected ? 40.h : 16.h,
            width: isSelected ? 35.h : 16.h,
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
                  style: TextStyle(
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
