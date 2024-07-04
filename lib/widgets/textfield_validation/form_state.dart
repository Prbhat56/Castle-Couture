part of 'form_cubit.dart';

abstract class FormState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ErrorState extends FormState{
  final String? errorMessage;

  ErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}


class ValidState extends FormState{}
