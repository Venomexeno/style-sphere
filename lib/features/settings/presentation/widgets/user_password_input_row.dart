import 'package:ecommerce/core/widgets/custom_text_field_password_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPasswordInputRow extends StatelessWidget {
  const UserPasswordInputRow({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    required this.title,
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
          child: CustomTextFieldPasswordFormWidget(
            validator: validator,
            hintText: hintText,
            controller: controller,
          ),
        )
      ],
    );
  }
}
