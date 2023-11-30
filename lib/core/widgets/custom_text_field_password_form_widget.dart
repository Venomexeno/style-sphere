import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldPasswordFormWidget extends StatefulWidget {
  const CustomTextFieldPasswordFormWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;

  @override
  State<CustomTextFieldPasswordFormWidget> createState() =>
      _CustomTextFieldPasswordFormWidgetState();
}

class _CustomTextFieldPasswordFormWidgetState extends State<CustomTextFieldPasswordFormWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(
              () {
                isObscureText = !isObscureText;
              },
            );
          },
          icon: Icon(
            isObscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
        ),
        hintText: widget.labelText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
