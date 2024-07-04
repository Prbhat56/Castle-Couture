part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {
  final String value;

  LoginValidState(this.value);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class LoginInValidState extends LoginState {}
class LoginLoadingState extends LoginState {} 
