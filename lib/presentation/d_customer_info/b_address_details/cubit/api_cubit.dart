// import 'package:bloc/bloc.dart';
// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/address_data_model.dart';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AddressState {}

// class AddressLoadingState extends AddressState {}

// class AddressValidState extends AddressState {
//   final Address address;
//   AddressValidState(this.address);
// }

// class AddressCubit extends Cubit<AddressState> {
//   AddressCubit() : super(AddressLoadingState());

//   void submitAddressDetails({
//     required String address,
//     required String city,
//     required String country,
//     required String zipCode,

//     required int contactId,
//   }) async {
//     try {
//       emit(AddressLoadingState()); // Emit loading state
//       // Call the API to create the address
//       Address newAddress = await ApiService.createAddress(
//         address1: address,
//         city: city,
//         contactId: contactId,
//         country: country,
//         zip: zipCode,
   
//       );
//        SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setInt('address_id', newAddress.id);
//       emit(AddressValidState(newAddress)); // Emit valid state with the created address
//     } catch (e) {
//       emit(AddressLoadingState()); // Emit loading state again in case of failure
//       // Handle error here if needed
//     }
//   }
// }
