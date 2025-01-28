import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:url_app/features/presentation/cubit/url_cubit.dart';

import '../bloc/cubit/global_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache_helper/cache_helper.dart';
import '../database/sqf_helper/sqf_helper.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  //cubit
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => UrlCubit());


  //auth feature

  //external
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => SqfliteHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
