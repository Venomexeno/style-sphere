import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/constants/text_field_passowrd_widget.dart';
import 'package:ecommerce/core/constants/text_form_field_widget.dart';
import 'package:ecommerce/core/widgets/snak_bar_widget.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/check_email_cubit/check_email_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              'Sign Up',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create an new account',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: const Color(0xff666666),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldFormWidget(
                    controller: _nameController,
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your name';
                      }
                      if (!RegExp("^[a-zA-Z ]*\$").hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldFormWidget(
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
                  const SizedBox(height: 20),
                  TextFieldPasswordWidget(
                    labelText: 'Password',
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
                  const SizedBox(height: 20),
                  TextFieldPasswordWidget(
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    controller: _confirmPasswordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter your password';
                      }
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        return 'password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocListener<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSuccess) {
                        print('Success SignUp');
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.authPageRoute);
                      }
                      if (state is SignUpFailure) {
                        final snackBar = SnackBarWidget(text: state.errMessage);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar as SnackBar);
                      }
                    },
                    child: BlocConsumer<CheckEmailCubit, CheckEmailState>(
                      listener: (context, state) {
                        if (state is CheckEmailSuccess) {
                          if (state.checkEmail.isAvailableEntity == false) {
                            const snackBar = SnackBar(
                              duration: Duration(seconds: 2),
                              content: Center(
                                child: Text('Email is already taken'),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (state.checkEmail.isAvailableEntity == true){
                            BlocProvider.of<SignUpCubit>(context).signUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                            );
                          }
                        }
                        if (state is CheckEmailFailure) {
                          final snackBar =
                              SnackBarWidget(text: state.errMessage);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar as SnackBar);
                        }
                      },
                      builder: (context, state) {
                        if (state is CheckEmailLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                              BlocProvider.of<CheckEmailCubit>(context)
                                  .checkEmail(email: _emailController.text);
                            } else {}
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
