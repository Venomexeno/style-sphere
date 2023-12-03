import 'package:ecommerce/features/product_details/presentation/manager/product_size_selector_cubit/product_size_selector_cubit.dart';
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
        final cubit = context.read<ProductSizeSelectorCubit>();
        cubit.selectSize(size);
      },
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
              size,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? Colors.white : const Color(0xff888888),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSizeSelector extends StatelessWidget {
  const ProductSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
          return SizeButton(
            size: size,
            isSelected: context.watch<ProductSizeSelectorCubit>().state == size,
          );
        }).toList(),
      ),
    );
  }
}
