import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkeyz_task/shared/extensions/cubit_extension.dart';
import 'state.dart';

class NetworkCubit extends Cubit<NetworkStates> {
  NetworkCubit() : super(NoErrorState());

  static NetworkCubit get(BuildContext context) => BlocProvider.of(context);

  Future<Map<String, dynamic>> onRequestCallback() async {
    return {
      "Authorization": "Bearer token",
    };
  }

  Future<void> onResponseCallback(Response response) async {
    if (response.data != null &&
        response.data is Map &&
        (response.data as Map).containsKey('logout') &&
        response.data['logout'] == true) {
      safeEmit(UnauthenticatedState("قد تم تسجيل خروجك تلقائيًا."));
    }
  }

  Future<void> onErrorCallback(DioError error) async {
    final response = error.response;
    if (response != null) {
      if ((response.statusCode == 500 || response.statusCode == 401) &&
          response.data.toString().contains('Unauthenticated')) {
        safeEmit(
          UnauthenticatedState(
            "قد تم تسجيل خروجك تلقائيًا.",
          ),
        );
      }
    }
  }
}
