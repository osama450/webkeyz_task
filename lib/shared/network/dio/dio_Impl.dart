import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:webkeyz_task/shared/network/dio/app_interceptors.dart';
import 'package:webkeyz_task/shared/network/dio/dio_helper.dart';

typedef RequestCallback = Future<Map<String, dynamic>> Function();
typedef ResponseCallback = Future<void> Function(Response);
typedef ErrorCallback = Future<void> Function(DioError);

class DioImpl extends DioHelper {
  final RequestCallback? onRequest;
  final ResponseCallback? onResponse;
  final ErrorCallback? onError;
  final CacheOptions? cacheOptions;

  final String baseURL;
  late Dio client;

  DioImpl({
    required this.baseURL,
    this.onResponse,
    this.onRequest,
    this.onError,
    this.cacheOptions,
  }) {
    client = Dio()
      ..interceptors.addAll([
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
          ),
        RequestsInspectorInterceptor(),
        if (cacheOptions != null)
          DioCacheInterceptor(
            options: cacheOptions!,
          ),
        AppInterceptors(
          onRequest,
          onResponse,
          onError,
        ),
      ])
      ..options.baseUrl = baseURL
      ..options.headers.addAll({'Accept': 'application/json'});
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  }) {
    return client.get(
      url,
      queryParameters: queryParams,
      options: cacheOptions?.toOptions(),
    );
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  }) {
    return client.post(
      url,
      data: data,
      queryParameters: queryParams,
      options: cacheOptions?.toOptions(),
    );
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  }) {
    return client.put(
      url,
      data: data,
      queryParameters: queryParams,
      options: cacheOptions?.toOptions(),
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    CacheOptions? cacheOptions,
  }) {
    return client.delete(
      url,
      data: data,
      queryParameters: queryParams,
      options: cacheOptions?.toOptions(),
    );
  }
}
