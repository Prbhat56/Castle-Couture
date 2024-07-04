// import 'package:castle_couture/presentation/a_authentication_screen/login_screen/first_screen/cubit/form.dart';
// import 'package:castle_couture/presentation/a_authentication_screen/signup_screen/cubit/form_validation_cubit/custom_form_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/app_export.dart';
// import '../../../../../core/utils/global_key_constant.dart';

// class CustomFirstScreenCubit extends Cubit<CustomFirstScreenFormState> {
//   CustomFirstScreenCubit() : super(const CustomFirstScreenFormState());




//   void resetState() {
//     emit(const CustomFirstScreenFormState());
//     emit(state.copyWith(isFormValid: false));
//   }



//   bool validateCurrentState(bool validationCheck) {
//     if (true) {
//       validateForm();
//     }
//     return validationCheck;
//   }

//   void onChangedEmail(String value) {
//     validateField(value, (isValid) {
//       emit(state.copyWith(email: value, isEmailValid: isValid));
//     });
//   }



//   void onChangedPassword(String value) {
//     validateField(value, (isValid) {
//       emit(state.copyWith(password: value, isPasswordValid: isValid));
//     });
//   }






//   void togglePasswordVisibility() {
//     emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
//   }

//   void validateField(String value, Function(bool) callback) {
//     if (CastleKeys.castlekey7.currentState?.validate() ?? false) {
//       callback(true);
//       validateCurrentState(true);
//     } else {
//       callback(false);
//       validateCurrentState(false);
//     }
//   }

//   void validateForm() {
//     if (CastleKeys.castlekey7.currentState?.validate() ?? false) {
//       emit(state.copyWith(isFormValid: true));

//       print('valid state ;;;;;;;;;;;;;;;;');
//       print(CastleKeys.castlekey7.currentState?.validate().toString() ?? false);
//     } else {
//       emit(state.copyWith(isFormValid: false));

//       print('Invalid state');
//     }
//   }
// }

