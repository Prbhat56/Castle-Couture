// import 'package:castle_couture/api_integration/api_constant/api_constant.dart';
// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/contact_data_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PersonalDeatilAPICubit extends Cubit<PersonalDetailAPIFormState> {
//   PersonalDeatilAPICubit() : super(PersonalDetailFormInitial());

//   void setLoading(bool isLoading) {
//     if (isLoading) {
//       emit(PersonalDetailFormLoading());
//     } else {
//       emit(PersonalDetailFormValid()); // Assuming form is valid at this point
//     }
//   }

//   void submitContactDetails({
//     required String firstName,
//     required String lastName,
//     required String phoneNumber,
//     required String phoneType, // 'Mobile', 'Home', or 'Work'
//     required String email,

//   }) async {
//     setLoading(true);

//     String mobilePhoneNumber = phoneType == "Mobile" ? phoneNumber : "";
//     String homePhoneNumber = phoneType == "Home" ? phoneNumber : "";
//     String workPhoneNumber = phoneType == "Work" ? phoneNumber : "";

//      try {
//       String retailerId = ApiConstants.retailerId; 
//       Contact contact = await ApiService.createContact(
//         retailerId: retailerId,
//         status: "A",
//         typeId: 0, 
//         firstName: firstName,
//         lastName: lastName,
//         mobilePhoneNumber: mobilePhoneNumber,
//         homePhoneNumber: homePhoneNumber,
//         workPhoneNumber: workPhoneNumber,
//         emailAddress: email,
  
//       );

//       // Save the contact ID to SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setInt('contact_id', contact.id);

//       emit(PersonalDetailFormValid());
      
//       // On successful contact creation, emit a success state or navigate to the next screen
//     } catch (e) {
//       emit(PersonalDetailFormInvalid(e.toString()));
//     } finally {
//       setLoading(false);
//     }
//   }

//   void resetState() {
//     emit(PersonalDetailFormInitial());
//   }



// }

// // Define the states
// abstract class PersonalDetailAPIFormState {}

// class PersonalDetailFormInitial extends PersonalDetailAPIFormState {}

// class PersonalDetailFormLoading extends PersonalDetailAPIFormState {}

// class PersonalDetailFormValid extends PersonalDetailAPIFormState {}

// class PersonalDetailFormInvalid extends PersonalDetailAPIFormState {
//   final String errorMessage;
//   PersonalDetailFormInvalid(this.errorMessage);
// }
