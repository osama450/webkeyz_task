import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

abstract class DioHelper {
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  });

  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  });

  Future<Response<T>> delete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  });

  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  });
}
