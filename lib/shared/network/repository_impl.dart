import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:webkeyz_task/shared/network/dio/dio_helper.dart';
import 'package:webkeyz_task/shared/network/repository.dart';

class RepoImpl extends Repository {
  final DioHelper dioHelper;
  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.refreshForceCache,
    hitCacheOnErrorExcept: [401, 403, 422],
    maxStale: const Duration(minutes: 3),
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: true,
  );

  RepoImpl({
    required this.dioHelper,
  });
}
