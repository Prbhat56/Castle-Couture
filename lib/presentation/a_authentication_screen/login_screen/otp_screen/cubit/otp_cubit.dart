import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  late Timer _timer;
  int _remainingTimer = 30;
  bool isButtonEnabled = false;

  OtpCubit() : super(OtpInitial());

  void otpTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTimer > 0) {
        _remainingTimer--;
        emit(OtpTimerTickState(remainTiming: _remainingTimer));
      } else {
        _timer.cancel();
        emit(OtpTimeExpiredState());
      }
    });
  }

  void resetTimer() {
    _remainingTimer = 30;
    emit(OtpTimeResetState());
  }

  void onOtpEntered(String otp) {
    if (otp == '1234') {
      // _timer.cancel();
      //  emit(OtpTimeExpiredState());
      //  emit(OtpTimeResetState());
      emit(OtpSuccessState());
      isButtonEnabled = true;
      if (_remainingTimer == 30) {
        otpTimer();
      }
    } else if (otp != '1234') {
      emit(OtpErrorState());
      isButtonEnabled = false;
      if (_remainingTimer == 30) {
        otpTimer();
      }
    } else {
      emit(OtpErrorState());
      isButtonEnabled = false;
      /* if(_remainingTimer == 30){
         // _timer.cancel();
        //  emit(OtpTimeExpiredState());
       //   emit(OtpTimeResetState());
         // otpTimer();
        }*/
      if (_remainingTimer == 30) {
        otpTimer();
      }
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
