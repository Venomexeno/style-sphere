import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizerSelector extends StatefulWidget {
  const ProductSizerSelector({super.key});

  @override
  State<ProductSizerSelector> createState() => _ProductSizerSelectorState();
}

class _ProductSizerSelectorState extends State<ProductSizerSelector> {
  String selectedSize = 'S';

  void selectSize(String newSize) {
    setState(() {
      selectedSize = newSize;
    });
  }

  Widget buildSizeButton(String size) {
    return GestureDetector(
      onTap: () => selectSize(size),
      child: SizedBox(
        width: 55.h,
        height: 55.h,
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedSize == size ? Colors.black : Colors.transparent,
            border: Border.all(color: const Color(0xffDDDDDD)),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                fontSize: 16.sp,
                color: selectedSize == size ? Colors.white : const Color(0xff888888),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          ['S', 'M', 'L', 'XL','XXL'].map((size) => buildSizeButton(size)).toList(),
    );
  }
}
