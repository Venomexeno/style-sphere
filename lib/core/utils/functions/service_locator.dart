import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_service.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote_data_source/login_remote_data_source/login_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/login_repo_impl.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repo.dart';
import 'package:ecommerce/features/auth/domain/use_cases/fetch_token_use_case.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Cubit
    // login Cubit
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //login use case
    sl.registerLazySingleton<FetchTokenUseCase>(
        () => FetchTokenUseCase(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //login Repo
    sl.registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(loginRemoteDataSource: sl.call()));

    //-------------------------------------------------------------------------------------------------//
    //DataSource
    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(sl.call()));

    ///External
    // API Service
    sl.registerLazySingleton<ApiService>(() => ApiService(sl.call()));

    //Dio
    sl.registerLazySingleton<Dio>(() => Dio());
  }
}
