import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          CustomElevatedButtonWidget(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.loginPageRoute);

            },
            buttonText: 'Login',
          ),
          const SizedBox(height: 20),
          CustomElevatedButtonWidget(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.signUpPageRoute);

            },
            buttonText: 'Sign Up',
          ),

        ],
      ),
    );
  }
}
