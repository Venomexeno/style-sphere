import 'package:ecommerce/features/product_details/presentation/manager/product_color_cubit/product_color_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.color,
    required this.isSelected,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ProductColorSelectorCubit>();
        cubit.selectProductColor(color);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 38.h,
          height: 38.h,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffDDDDDD)),
            ),
            child: isSelected
                ? Icon(Icons.check, color: Colors.black, size: 11.sp)
                : null,
          ),
        ),
      ),
    );
  }
}

class ProductColorSelector extends StatelessWidget {
  const ProductColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Colors.white,
            Colors.red,
            Colors.grey,
            Colors.orange,
          ].map((color) {
            return ColorButton(
              color: color,
              isSelected:
                  context.watch<ProductColorSelectorCubit>().state == color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
