import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return const SnackBar(
      duration: Duration(seconds: 2),
      content: Center(
        child: Text('Email is already taken'),
      ),
    );
  }
}
