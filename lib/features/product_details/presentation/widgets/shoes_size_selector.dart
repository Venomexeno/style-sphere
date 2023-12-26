import 'package:ecommerce/features/product_details/presentation/manager/shoes_size_selector_cubit/shoes_size_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeButton extends StatelessWidget {
  final int size;
  final bool isSelected;

  const SizeButton({
    super.key,
    required this.size,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ShoesSizeSelectorCubit>();
        cubit.selectSize(size);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: SizedBox(
          width: 55.h,
          height: 55.h,
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black : Colors.transparent,
              border: Border.all(color: const Color(0xffDDDDDD)),
            ),
            child: Center(
              child: Text(
                '$size',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isSelected ? Colors.white : const Color(0xff888888),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShoesSizeSelector extends StatelessWidget {
  const ShoesSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46].map((size) {
            return SizeButton(
              size: size,
              isSelected: context.watch<ShoesSizeSelectorCubit>().state == size,
            );
          }).toList(),
        ),
      ),
    );
  }
}
