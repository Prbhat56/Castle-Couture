import 'package:castle_couture/presentation/b_home_page/c_profile_screen/cubit/profile_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/global_key_constant.dart';

class ProfileFormCubit extends Cubit<ProfileFormState> {
  ProfileFormCubit() : super(ProfileFormState());


  void resetState() {
    emit( ProfileFormState());
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

  void onChangedDateOfBirth(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(dateOfBirth: value, isDateOfBirthValid: isValid));
    });
  }

    void onChangedMobileNumber(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(mobileNumber: value, isMobileNumberValid: isValid));
    });
  }

  void onChangedEmail(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(email: value, isEmailValid: isValid));
    });
  }

  void onChangedAddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(address: value, isAddressValid: isValid));
    });
  }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey6.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey6.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey6.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}

