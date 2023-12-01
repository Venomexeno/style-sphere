import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button_widget.dart';
import 'package:ecommerce/features/settings/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:ecommerce/features/settings/presentation/widgets/settings_avatar_cached_network_image.dart';
import 'package:ecommerce/features/settings/presentation/widgets/user_data_input_row.dart';
import 'package:ecommerce/features/settings/presentation/widgets/user_password_input_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({
    super.key,
    required this.name,
    required this.email,
    required this.id,
    required this.imageUrl,
  });

  final String name;
  final String email;
  final int id;
  final String imageUrl;

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 25, top: 15, left: 25),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                  width: 50.h,
                  height: 50.h,
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SettingsAvatarCachedNetworkImage(
                    imageUrl: widget.imageUrl,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Profile Image',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UserDataInputRow(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your name';
                          }
                          if (!RegExp("^[a-zA-Z ]*\$").hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        controller: _nameController,
                        hintText: 'Enter your name',
                        title: 'Name',
                      ),
                      UserDataInputRow(
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
                        controller: _emailController,
                        hintText: 'email@example.com',
                        title: 'Email',
                      ),
                      UserPasswordInputRow(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter a Password';
                          }
                          if (value.length < 6) {
                            return 'Password must contain 6 characters at least';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        hintText: 'Enter your password',
                        title: 'Password',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<UpdateUserCubit, UpdateUserState>(
                  listener: (context, state) {
                    if (state is UpdateUserSuccess) {
                      // const snackBar =
                      //     CustomSnackBarWidget(text: 'Updated Successfully');
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(snackBar as SnackBar);
                      const snackBar = SnackBar(
                        content: Center(
                          child: Text('Updated Successfully'),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is UpdateUserFailure) {
                      final snackBar = SnackBar(
                        content: Center(
                          child: Text(state.errMessage),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateUserLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomElevatedButtonWidget(
                      borderRadius: 15.r,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UpdateUserCubit>(context).updateUser(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            id: widget.id,
                          );
                        }
                      },
                      buttonText: 'Update Data',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24,
                  bottom: 24,
                ),
                child: CustomElevatedButtonWidget(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout_outlined),
                      const SizedBox(width: 10),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  borderRadius: 15.r,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.loginPageRoute, (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
