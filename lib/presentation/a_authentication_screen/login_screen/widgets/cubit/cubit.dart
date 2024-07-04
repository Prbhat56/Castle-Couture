

// import 'package:castle_couture/core/utils/global_key_constant.dart';
// import 'package:castle_couture/presentation/a_authentication_screen/login_screen/widgets/cubit/form.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomNumberCubit extends Cubit<CustomNumberFormState> {
//   CustomNumberCubit() : super(const CustomNumberFormState());


//   void onChangedNumber(String value) {
//     validateField(value, (isValid) {
//       emit(state.copyWith(number: value, isNumberValid: isValid));
//     });
//   }

//   void resetState() {
//     emit(const CustomNumberFormState());
//     emit(state.copyWith(isButtonValid: false));
//   }



//   bool validateCurrentState(bool validationCheck) {
//     if (true) {
//       validateForm();
//     }
//     return validationCheck;
//   }








//   void validateField(String value, Function(bool) callback) {
//     if (CastleKeys.castlekey8.currentState?.validate() ?? false) {
//       callback(true);
//       validateCurrentState(true);
//     } else {
//       callback(false);
//       validateCurrentState(false);
//     }
//   }

//   void validateForm() {
//     if (CastleKeys.castlekey8.currentState?.validate() ?? false) {
//       emit(state.copyWith(isButtonValid: true));

//       print('valid state ;;;;;;;;;;;;;;;;');
//       print(CastleKeys.castlekey8.currentState?.validate().toString() ?? false);
//     } else {
//       emit(state.copyWith(isButtonValid: false));

//       print('Invalid state');
//     }
//   }
// }

