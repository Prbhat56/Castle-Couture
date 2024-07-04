 
// import 'package:castle_couture/api_integration/api_service/api_service.dart';
//import 'package:castle_couture/api_integration/data_model/get_method_user_data_model.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

//class SignupCubit extends Cubit<SignupState> {
//   SignupCubit() : super(SignupInitial());

//   void createRole() async {
//     emit(SignupLoading());
//     try {
//       Role role = await ApiService.createRole();
 
//       emit(SignupRoleCreated(role));
//     } catch (e) {
//       emit(SignupError(e.toString()));
//     }
//   }
// }

// // Define the states
// abstract class SignupState {}

// class SignupInitial extends SignupState {}

// class SignupLoading extends SignupState {}

// class SignupRoleCreated extends SignupState {
//   final Role role;
//   SignupRoleCreated(this.role);
// }

// class SignupError extends SignupState {
//   final String message;
//   SignupError(this.message);
// }
