import 'package:ecommerce/features/auth/data/data_sources/login_data_source/remote_data_source/login_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/sign_up_data_source/remote_data_source/sign_up_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/login_repositories/login_repo_impl.dart';
import 'package:ecommerce/features/auth/data/repositories/sign_up_repositories/sign_up_repo_impl.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repositories/login_repo.dart';
import 'package:ecommerce/features/auth/domain/repositories/sign_up_repositories/sign_up_repo.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases/fetch_token_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/check_email_cubit/check_email_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo_impl.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_new_arrivals_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Cubit
    // login Cubit
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl.call()));

    // signup Cubit
    sl.registerFactory<CheckEmailCubit>(() => CheckEmailCubit(sl.call()));
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl.call()));

    // Home Cubit
    sl.registerFactory<NewArrivalsCubit>(() => NewArrivalsCubit(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //login use case
    sl.registerLazySingleton<FetchTokenUseCase>(
        () => FetchTokenUseCase(sl.call()));

    //signup use case
    sl.registerLazySingleton<CheckEmailUseCase>(
            () => CheckEmailUseCase(sl.call()));
    sl.registerLazySingleton<SignUpUseCase>(
            () => SignUpUseCase(sl.call()));

    //Home use case
    sl.registerLazySingleton<FetchNewArrivalsUseCase>(
            () => FetchNewArrivalsUseCase(sl.call()));


    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //login Repo
    sl.registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(loginRemoteDataSource: sl.call()));

    //signup Repo
    sl.registerLazySingleton<SignUpRepo>(
            () => SignUpRepoImpl(sl.call()));

    //Home Repo
    sl.registerLazySingleton<HomeRepo>(
            () => HomeRepoImpl(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///DataSource
    //login data source
    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl());

    //signup data source
    sl.registerLazySingleton<SignUpRemoteDataSource>(
            () => SignUpRemoteDataSourceImpl());

    //Home data source
    sl.registerLazySingleton<HomeRemoteDataSource>(
            () => HomeRemoteDataSourceImpl());


  }
}
