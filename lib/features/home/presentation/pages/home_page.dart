import 'package:ecommerce/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(
        token: token,
      ),
    );
  }
}
