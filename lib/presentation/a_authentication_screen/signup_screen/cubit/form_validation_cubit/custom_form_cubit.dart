import 'package:castle_couture/presentation/a_authentication_screen/signup_screen/cubit/form_validation_cubit/custom_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/global_key_constant.dart';

class CustomFormCubit extends Cubit<CustomFormState> {
  CustomFormCubit() : super(const CustomFormState());


  //final signupFormKey = GlobalKey<FormState>();

  void resetState() {
    emit(const CustomFormState());
    emit(state.copyWith(isFormValid: false));
  }



  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedEmail(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(email: value, isEmailValid: isValid));
    });
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

  void onChangedAddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(address: value, isAddressValid: isValid));
    });
  }

  void onChangedAptUnit(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(aptUnit: value, isAptUnitValid: isValid));
    });
  }

  void onChangedCity(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(city: value, isCityValid: isValid));
    });
  }

  void onChangedZipCode(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(zipCode: value, isZipCodeValid: isValid));
    });
  }

  void onChangedPassword(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(password: value, isPasswordValid: isValid));
    });
  }

  void onChangedConfirmPassword(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          confirmPassword: value, isConfirmPasswordValid: isValid));
    });
  }

  void onChangedStateDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(stateDropdown: value, isStateDropdown: isValid));
    });
  }

  void onChangedCountryDropdown(String? value) {
    validateField(value!, (isValid) {
      emit(state.copyWith(countryDropdown: value, isCountryDropdown: isValid));
    });
  }


  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey1.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey1.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey1.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}

