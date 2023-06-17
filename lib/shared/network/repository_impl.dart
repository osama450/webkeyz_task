import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/shared/constants.dart';
import 'package:webkeyz_task/shared/network/dio/dio_helper.dart';
import 'package:webkeyz_task/shared/network/repository.dart';

class RepoImpl extends Repository {
  final DioHelper? dioHelper;
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

  @override
  Future<Either<dynamic, List<ProductModel>>> getProducts() {
    ///This logic for get data from api
    // return _responseHandling<List<ProductModel>>(
    //   onSuccess: () async {
    //     final f = await dioHelper.get(
    //       EndPoints + '/products',
    //     );
    //     return f.data.map((e) => ProductModel.fromJson(e)).toList();
    //   },
    // );
    return Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then(
      (value) => Right(LocalData.products),
    );
  }
}

extension on Repository {
  dynamic onServerErrorBase(dynamic e) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.badResponse:
          Object? msg;
          msg = e.response?.data['error_msg'];
          msg ??= e.response?.data['message'];
          return msg ?? e.error;
        case DioErrorType.unknown:
          return 'تحقق من إتصالك بالإنترنت ثم أعد المحاولة';
        default:
          return e.error;
      }
    }
    return e;
  }

  Future<Either<String, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on SocketException {
      return const Left('تحقق من إتصالك بالإنترنت ثم أعد المحاولة');
    } on Exception catch (e) {
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f.toString());
      }
      final f = onServerErrorBase(e);
      return Left(f.toString());
    }
  }
}
