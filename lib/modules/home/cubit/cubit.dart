import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/shared/extensions/cubit_extension.dart';
import 'package:webkeyz_task/shared/network/repository.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final Repository _repository;

  HomeCubit(this._repository) : super(InitialHomeState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  List<ProductModel> productList = [];
  int cartCount = 0;

  Future<void> getProducts() async {
    safeEmit(LoadingHomeStatePage());

    final f = await _repository.getProducts();
    f.fold(
      (l) async {
        safeEmit(ErrorHomeState(l.errorMsg ?? 'حدث خطأ ما'));
      },
      (r) async {
        productList.addAll(r);
        safeEmit(SuccessHomeState());
      },
    );
  }

  void addToCart() async {
    safeEmit(AddToCartLoadingState());
    await Future.delayed(const Duration(seconds: 1), () {
      cartCount++;
      safeEmit(AddToCartLoadedState());
    });
  }
}
