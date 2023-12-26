import 'package:ecommerce/features/product_details/presentation/manager/shirt_size_selector_cubit/shirt_size_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeButton extends StatelessWidget {
  final String size;
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
        final cubit = context.read<ShirtSizeSelectorCubit>();
        cubit.selectSize(size);
      },
      child: SizedBox(
        width: 60.h,
        height: 60.h,
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.black : Colors.transparent,
            border: Border.all(color: const Color(0xffDDDDDD)),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                fontSize: 15.sp,
                color: isSelected ? Colors.white : const Color(0xff888888),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShirtSizeSelector extends StatelessWidget {
  const ShirtSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
          return SizeButton(
            size: size,
            isSelected: context.watch<ShirtSizeSelectorCubit>().state == size,
          );
        }).toList(),
      ),
    );
  }
}
