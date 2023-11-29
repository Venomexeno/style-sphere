import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.token,
  });

  final String token;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        token,
      ),
    );
  }
}
