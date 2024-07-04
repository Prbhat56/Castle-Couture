import 'package:castle_couture/core/utils/global_key_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'other_detail_form_state.dart';

class OtherDetailsFormCubit extends Cubit<OtherDetailFormState> {

  OtherDetailsFormCubit() : super(const OtherDetailFormState());

  //final _otherDetailScreenFormKey = GlobalKey<FormState>();

  // Method to provide access to the form key



  void resetState() {
    emit(const OtherDetailFormState());
    emit(state.copyWith(isFormValid: false));
  }

  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedHowHeardDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          howHeardDropdown: value, isHowHeardDropdownValid: isValid));
    });
  }

  void onChangedEventDate(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(eventDate: value, isEventDateValid: isValid));
    });
  }

  void onChangedBudget(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(budget: value, isBudgetValid: isValid));
    });
  }

  void onChangedStylistDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          stylistDropdown: value, isStylistDropdownValid: isValid));
    });
  }

  void onChangedNotes(String value) {
    validateField(value, (isValid) {

      emit(state.copyWith(
          notes: value, isNotesValid: isValid));
    });
  }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey4.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey4.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey4.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}
