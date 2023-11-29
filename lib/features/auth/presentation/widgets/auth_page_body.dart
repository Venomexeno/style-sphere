import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:flutter/material.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.loginPageRoute);
          },
          child: const Text('Login'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.signUpPageRoute);
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
