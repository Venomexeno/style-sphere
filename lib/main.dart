import 'package:ecommerce/OnGenerateRoute.dart';
import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/service_locator.dart';
import 'package:ecommerce/core/utils/cache_helper.dart';
import 'package:ecommerce/core/utils/simple_bloc_observer.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/category_products/domain/entities/category_products_entity.dart';
import 'package:ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce/features/home/domain/entities/new_arrivals_entity.dart';
import 'package:ecommerce/features/order/presentation/manager/order_cubit.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_category_entity.dart';
import 'package:ecommerce/features/product_details/domain/entities/product_details_entity.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator().init();

  Bloc.observer = SimpleBlocObserver();

  await CacheHelper.init();

  await Hive.initFlutter();
  Hive.registerAdapter(NewArrivalsEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(ProfileEntityAdapter());
  Hive.registerAdapter(ProductDetailsEntityAdapter());
  Hive.registerAdapter(ProductCategoryEntityAdapter());
  Hive.registerAdapter(CategoryProductsEntityAdapter());

  await Hive.openBox<NewArrivalsEntity>(kNewArrivals);
  await Hive.openBox<CategoryEntity>(kCategory);
  await Hive.openBox<ProfileEntity>(kProfile);
  await Hive.openBox<ProductDetailsEntity>(kProductDetails);
  await Hive.openBox<ProductCategoryEntity>(kProductCategory);
  await Hive.openBox<CategoryProductsEntity>(kCategoryProducts);

  String token = CacheHelper.getData(key: 'token') ?? '';
  String pageRoute;

  if (token.isEmpty) {
    pageRoute = AppRoutes.authPageRoute;
  } else {
    pageRoute = AppRoutes.rootPageRoute;
  }

  runApp(MyApp(
    startRoute: pageRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String startRoute;

  const MyApp({
    super.key,
    required this.startRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CartCubit>(
              create: (context) => sl<CartCubit>(),
            ),
            BlocProvider<OrderCubit>(
              create: (context) => sl<OrderCubit>(),
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: OnGenerateRoute.routes,
            initialRoute: startRoute,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: Colors.black,
                  ),
              textTheme:
                  GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
