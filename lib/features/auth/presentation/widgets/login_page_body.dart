import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/widgets/custom_text_field_password_form_widget.dart';
import 'package:ecommerce/core/widgets/custom_text_field_form_widget.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please login or sign up to continue our app',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: const Color(0xff666666),
              ),
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFieldFormWidget(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldPasswordFormWidget(
                    labelText:'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Password';
                      }
                      if (value.length < 6) {
                        return 'Password must contain 6 characters at least';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.homePageRoute,arguments: state.token.accessTokenEntity);
                }
                if (state is LoginFailure) {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Center(
                      child: Text(state.errMessage),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 80.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).fetchToken(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    } else {}
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
