import 'package:ecommerce/core/widgets/custom_text_field_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataInputRow extends StatelessWidget {
  const UserDataInputRow({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText, this.validator,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            title,
            style: TextStyle(
              color: const Color(0xff666666),
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        const SizedBox(width: 30),
        Flexible(
          child: CustomTextFieldFormWidget(
            validator: validator,
            hintText: hintText,
            textInputType: TextInputType.text,
            controller: controller,
          ),
        )
      ],
    );
  }
}
