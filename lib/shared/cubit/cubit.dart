import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/repository.dart';
import 'states.dart';

class SharedCubit extends Cubit<SharedStates> {
  final Repository _repository;

  SharedCubit(this._repository) : super(InitialSharedState());

  static SharedCubit get(BuildContext context) => BlocProvider.of(context);

  SharedStates get initialState => InitialSharedState();
}
