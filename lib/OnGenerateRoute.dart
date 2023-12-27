import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/service_locator.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/check_email_cubit/check_email_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce/features/auth/presentation/pages/auth_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce/features/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce/features/category_products/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:ecommerce/features/category_products/presentation/pages/category_products_page.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/product_details/presentation/manager/fetch_product_details_cubit/fetch_product_details_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_color_cubit/product_color_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/shirt_size_selector_cubit/shirt_size_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/shoes_size_selector_cubit/shoes_size_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/pages/product_details_page.dart';
import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:ecommerce/features/root/presentation/pages/root_page.dart';
import 'package:ecommerce/features/settings/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:ecommerce/features/settings/presentation/pages/settings_page.dart';
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

      case AppRoutes.rootPageRoute:
        return materialBuilder(
          widget: BlocProvider<NavigationCubit>(
            create: (context) => sl<NavigationCubit>(),
            child: RootPage(
              token: settings.arguments as String,
            ),
          ),
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

      case AppRoutes.settingsPageRoute:
        return materialBuilder(
          widget: BlocProvider<UpdateUserCubit>(
            create: (context) => sl<UpdateUserCubit>(),
            child: SettingsPage(userEntity: settings.arguments as UserEntity),
          ),
          settings: settings,
        );

      case AppRoutes.categoryProductsPageRoute:
        return MaterialPageRoute(
          builder: (context) {
            final CategoryEntity argument =
                settings.arguments as CategoryEntity;
            return BlocProvider<CategoryProductsCubit>(
              create: (context) => sl<CategoryProductsCubit>()
                ..fetchCategoryProducts(id: argument.idEntity),
              child: CategoryProductsPage(
                categoryTitle: argument.nameEntity,
              ),
            );
          },
          settings: settings,
        );

      case AppRoutes.productDetailsPageRoute:
        return materialBuilder(
          widget: MultiBlocProvider(
            providers: [
              BlocProvider<ProductQuantityCubit>(
                create: (context) => sl<ProductQuantityCubit>(),
              ),
              BlocProvider<ShirtSizeSelectorCubit>(
                create: (context) => sl<ShirtSizeSelectorCubit>(),
              ),
              BlocProvider<ShoesSizeSelectorCubit>(
                create: (context) => sl<ShoesSizeSelectorCubit>(),
              ),
              BlocProvider<ProductColorSelectorCubit>(
                create: (context) => sl<ProductColorSelectorCubit>(),
              ),
              BlocProvider<FetchProductDetailsCubit>(
                create: (context) => sl<FetchProductDetailsCubit>()
                  ..fetchProductDetails(id: settings.arguments as int),
              ),
            ],
            child: const ProductDetailsPage(),
          ),
          settings: settings,
        );

      case AppRoutes.cartPageRoute:
        return materialBuilder(
          widget: const CartPage(),
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

MaterialPageRoute materialBuilder({
  required Widget widget,
  required RouteSettings settings,
  dynamic argument,
}) {
  return MaterialPageRoute(
    builder: (context) => widget,
    settings: settings,
  );
}
