import 'package:flutter/foundation.dart';

@immutable
abstract class SharedStates {
  const SharedStates();
}

class InitialSharedState extends SharedStates {}

class LoadingSharedState extends SharedStates {}

class ReloadingSharedState extends SharedStates {}

class SuccessSharedState extends SharedStates {}

class ChangeState extends SharedStates {}

class SuccessLoggedOutState extends SharedStates {}

class SuccessUserSharedState extends SharedStates {}

class ErrorSharedState extends SharedStates {
  final String error;

  const ErrorSharedState(this.error);
}
