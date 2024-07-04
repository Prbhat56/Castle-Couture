
import 'package:castle_couture/core/app_export.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  bool isButtonEnabled = false;

  void validatePhoneNumber(String value) {


    if (value.length == 10) {
      emit(LoginValidState(value));
      isButtonEnabled = true;
    

    } else {
      emit(LoginInValidState());
      isButtonEnabled = false;
    }
  }
 void setLoading(bool isLoading) {
    if (isLoading) {
      emit(LoginLoadingState());
    } else {

      emit(LoginInitialState());
    }
  }
}
