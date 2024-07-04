// user_data_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataCubit extends Cubit<Map<String, String>> {
  UserDataCubit() : super({});

  void updateUserData(String key, String value) {
    final currentState = state;
    currentState[key] = value;
    emit(currentState);
  }

  String getUserData(String key) {
    return state[key] ?? '';
  }
}
