import 'package:ecommerce/features/auth/presentation/widgets/auth_page_body.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const AuthPageBody(),
      ),
    );
  }
}
