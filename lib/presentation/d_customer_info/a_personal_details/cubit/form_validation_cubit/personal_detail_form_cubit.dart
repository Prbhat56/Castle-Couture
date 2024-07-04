import 'package:castle_couture/presentation/d_customer_info/a_personal_details/cubit/form_validation_cubit/personal_detail_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/global_key_constant.dart';

class PersonalDetailFormCubit extends Cubit<PersonalDetailFormState> {
  PersonalDetailFormCubit() : super(const PersonalDetailFormState()) ;

 // final personalDetailFormKey = GlobalKey<FormState>();

  void resetState() {
    emit(const PersonalDetailFormState());
    emit(state.copyWith(isFormValid: false));
  }

  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedFirstName(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(firstName: value, isFirstNameValid: isValid));
    });
  }

  void onChangedLastName(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(lastName: value, isLastNameValid: isValid));
    });
  }

  void onChangedMobileDropdown(String? value) {
    validateField(value!, (isValid) {
      emit(state.copyWith(
          mobileDropdown: value, isMobileDropdownValid: isValid));
    });
  }

  void onChangedPhoneNumber(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(phoneNumber: value, isMobileNumberValid: isValid));
    });
  }

  void onChangedEmail(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(email: value, isEmailValid: isValid));
    });
  }

  void onChangedCheckBox(bool value) {
    emit(state.copyWith(isCheckboxValid: value));
  }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey2.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey2.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey2.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}
