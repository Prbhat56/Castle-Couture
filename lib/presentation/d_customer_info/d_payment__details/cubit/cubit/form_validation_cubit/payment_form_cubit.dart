import 'package:castle_couture/core/utils/global_key_constant.dart';
import 'package:castle_couture/presentation/d_customer_info/d_payment__details/cubit/cubit/form_validation_cubit/payment_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentFormCubit extends Cubit<PaymentFormState> {
  PaymentFormCubit() : super(const PaymentFormState());

  void resetState() {
    emit(const PaymentFormState());
    emit(state.copyWith(isFormValid: false));
  }

  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedCardHolderName(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          cardHolderName: value, isCardHolderNameValid: isValid));
    });
  }

  void onChangedCardNumber(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(cardNumber: value, isCardNumberValid: isValid));
    });
  }

  void onChangedExpiryMonth(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(expiryMonth: value, isExpiryMonthValid: isValid));
    });
  }

  void onChangedExpiryYear(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(expiryYear: value, isExpiryYearValid: isValid));
    });
  }

  void onChangedCvv(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(cvv: value, isCvvValid: isValid));
    });
  }

  // void onChangedCheckbox(bool isChecked) {
  //   emit(state.copyWith(
  //       isCheckBoxChecked: isChecked,
  //       isFormValid: isChecked ? state.isFormValid : true));
  // }

  void validateField(String value, Function(bool) callback) {
    if (CastleKeys.castleKey5.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }

  void validateForm() {
    if (CastleKeys.castleKey5.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(CastleKeys.castleKey5.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }
}
