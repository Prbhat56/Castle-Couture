import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/global_key_constant.dart';
import 'address_form_state.dart';

class AddressFormCubit extends Cubit<AddressFormState> {

  AddressFormCubit() : super(const AddressFormState());

  //final addressFormKey = GlobalKey<FormState>();


  void resetState() {
    emit(const AddressFormState());
    emit(state.copyWith(isFormValid: false));
  }

  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedAddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(address: value, isAddressValid: isValid));
    });
  }

  void onChangedCity(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(city: value, isCityValid: isValid));
    });
  }

  void onChangedCountryDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          countryDropdown: value, isCountryDropdownValid: isValid));
    });
  }

  void onChangedZipCode(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(zipCode: value, isZipCodeValid: isValid));
    });
  }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey3.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey3.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey3.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}
