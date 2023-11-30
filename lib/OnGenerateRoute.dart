import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/service_locator.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/check_email_cubit/check_email_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce/features/auth/presentation/pages/auth_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.authPageRoute:
        return materialBuilder(
          widget: const AuthPage(),
          settings: settings,
        );

      case AppRoutes.loginPageRoute:
        return materialBuilder(
          widget: BlocProvider<LoginCubit>(
            create: (context) => sl<LoginCubit>(),
            child: const LoginPage(),
          ),
          settings: settings,
        );

      case AppRoutes.signUpPageRoute:
        return materialBuilder(
          widget: MultiBlocProvider(
            providers: [
              BlocProvider<CheckEmailCubit>(
                  create: (context) => sl<CheckEmailCubit>()),
              BlocProvider<SignUpCubit>(create: (context) => sl<SignUpCubit>()),
            ],
            child: const SignUpPage(),
          ),
          settings: settings,
        );

      case AppRoutes.homePageRoute:
        return materialBuilder(
          widget: MultiBlocProvider(
            providers: [
              BlocProvider<UserCubit>(
                  create: (context) => sl<UserCubit>()
                    ..fetchUser(token: settings.arguments as String)),
              BlocProvider<NewArrivalsCubit>(
                  create: (context) =>
                      sl<NewArrivalsCubit>()..fetchNewArrivals()),
              BlocProvider<CategoriesCubit>(
                  create: (context) => sl<CategoriesCubit>()),
            ],
            child: const HomePage(),
          ),
          settings: settings,
        );

      default:
        return materialBuilder(
          widget: const ErrorPage(),
          settings: settings,
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Error Page'),
      ),
    );
  }
}

MaterialPageRoute materialBuilder(
    {required Widget widget, required RouteSettings settings}) {
  return MaterialPageRoute(
    builder: (context) => widget,
    settings: settings,
  );
}
