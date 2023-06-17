import 'package:flutter/foundation.dart';

@immutable
abstract class HomeStates {
  const HomeStates();
}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class LoadingHomeStatePage extends HomeStates {}

class SuccessHomeState extends HomeStates {}

class ChangeState extends HomeStates {}

class ErrorHomeState extends HomeStates {
  final String? error;

  const ErrorHomeState(this.error);
}

class AddToCartLoadingState extends HomeStates {}

class AddToCartLoadedState extends HomeStates {}
