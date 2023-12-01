import 'package:flutter/material.dart';

class CustomSnackBarWidget extends StatelessWidget {
  const CustomSnackBarWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: Center(
        child: Text(text),
      ),
    );
  }
}
