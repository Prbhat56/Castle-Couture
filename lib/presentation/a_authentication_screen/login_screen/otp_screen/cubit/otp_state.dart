part of 'otp_cubit.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpInitialState extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpSuccessState extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpErrorState extends OtpState {
  @override
  List<Object> get props => [];
}
class OtpTimerStartState extends OtpState{
  @override
  List<Object> get props => [];
}

class OtpTimerTickState extends OtpState {
  final int remainTiming;

  const OtpTimerTickState({required this.remainTiming});

  @override
  List<Object> get props => [remainTiming];
}

class OtpTimeExpiredState extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpTimeResetState extends OtpState {
  @override
  List<Object> get props => [];
}
