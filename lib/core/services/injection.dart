import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tamweely_task/core/database/cache/cache_helper.dart';

import '../../connection/network_info.dart';

import '../../features/products/data/datasources/products_local_data_source.dart';
import '../../features/products/data/datasources/products_remote_data_source.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';
import '../../features/products/domain/usecases/get_all_products_usecase.dart';
import '../../features/products/presentation/cubit/products_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;
void initGetIt() {
  //! constants
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        dio: Dio(),
        
      ));
  getIt.registerLazySingleton(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<DataConnectionChecker>()));

  //!Products

// Data Layer

  getIt.registerLazySingleton(
      () => ProductsRemoteDataSource(api: getIt<ApiConsumer>()));
  getIt.registerLazySingleton(
      () => ProductsLocalDataSource(cache: getIt<CacheHelper>()));
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      productsRemoteDataSource: getIt<ProductsRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
      localDataSource: getIt<ProductsLocalDataSource>(),
    ),
  );

// Domain Layer
  getIt.registerLazySingleton(
      () => GetAllProductsUseCase(repository: getIt<ProductsRepository>()));

// Presentation Layer
  getIt.registerFactory(() => ProductsCubit());
}
