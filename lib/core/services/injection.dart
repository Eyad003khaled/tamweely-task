import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../connection/network_info.dart';

import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;
void initGetIt() {

    //! constants

  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        dio: Dio(),
      
      ));
  getIt.registerLazySingleton(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<DataConnectionChecker>()));


}
