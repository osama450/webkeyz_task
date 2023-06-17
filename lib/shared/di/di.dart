import 'dart:async';
import 'dart:isolate';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/shared/cubit/cubit.dart';
import 'package:webkeyz_task/shared/local/cache_helper.dart';
import 'package:webkeyz_task/shared/network/cubit/cubit.dart';
import 'package:webkeyz_task/shared/network/dio/dio_Impl.dart';
import 'package:webkeyz_task/shared/network/dio/dio_helper.dart';
import 'package:webkeyz_task/shared/network/remote/api_endpoints.dart';
import 'package:webkeyz_task/shared/network/repository.dart';
import 'package:webkeyz_task/shared/network/repository_impl.dart';

GetIt di = GetIt.I;

Future<void> init() async {
  final sp = await SharedPreferences.getInstance();

  di.registerLazySingleton<SharedPreferences>(
    () => sp,
  );

  di.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      di<SharedPreferences>(),
    ),
  );

  di.registerLazySingleton<NetworkCubit>(
    () => NetworkCubit(),
  );

  di.registerLazySingleton<DioHelper>(
    () => DioImpl(
      baseURL: EndPoints.baseUrl,
      onRequest: di<NetworkCubit>().onRequestCallback,
      onResponse: di<NetworkCubit>().onResponseCallback,
      onError: di<NetworkCubit>().onErrorCallback,
      cacheOptions: CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.refreshForceCache,
        hitCacheOnErrorExcept: [401, 403, 422],
        maxStale: const Duration(minutes: 3),
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: true,
      ),
    ),
  );

  di.registerLazySingleton<Repository>(
    () => RepoImpl(
      dioHelper: di<DioHelper>(),
    ),
  );

  di.registerLazySingleton<ReceivePort>(
    () => ReceivePort(),
  );

  di.registerFactory<SharedCubit>(
    () => SharedCubit(
      di<Repository>(),
    ),
  );

  di.registerFactory<HomeCubit>(
    () => HomeCubit(
      di<Repository>(),
    ),
  );
}
