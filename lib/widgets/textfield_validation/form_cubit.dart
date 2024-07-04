import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(ValidState());

  void formField(String formId, String? value) {
    if (value == null || value.isEmpty) {
      emit(ErrorState('Please fill this field'));
    } else {
      emit(ValidState());
    }
  }
}
