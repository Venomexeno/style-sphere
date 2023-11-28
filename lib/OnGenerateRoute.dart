import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/functions/service_locator.dart';

class OnGenerateRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginPageRoute:
        return materialBuilder(
            widget: BlocProvider<LoginCubit>(
              create: (context) => sl<LoginCubit>(),
              child: const LoginPage(),
            ),
            settings: settings);

      case AppRoutes.homePageRoute:
        return materialBuilder(widget: const HomePage(), settings: settings);

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
