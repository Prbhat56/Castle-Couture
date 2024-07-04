import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/api_integration/data_model/new_contact_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_data.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_keys.dart';
import 'package:castle_couture/presentation/d_customer_info/b_address_details/cubit/form_validation_cubit/address_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/b_address_details/cubit/form_validation_cubit/address_form_state.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/other_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/global_key_constant.dart';

class AddressDetailScreen extends StatefulWidget {
  const AddressDetailScreen({super.key});

  @override
  State<AddressDetailScreen> createState() => _AddressDetailScreenState();
}

class _AddressDetailScreenState extends State<AddressDetailScreen> {

bool _isLoading=true;
      MappedContact? contactDetail;
    bool contact_detail_found=false;
  
  Future<void> _fetchContactDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int contactId = prefs.getInt('user_id') ?? 0;

    if (contactId != 0) {
       setState(() {
         contact_detail_found=true;
       });
      try {
        final apiService = ApiService();
        contactDetail = await apiService.fetchContactDetailById(contactId);

        loadUserDeails();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    setState(() {
      _isLoading = false;
    });
  }
  loadUserDeails() {
    
    _addressController.text = contactDetail?.address1 ?? '';
    _cityController.text = contactDetail?.city ?? '';
  }



  
  bool _isloadingpage = true;
  late List<Map<String, String>> statesList; // List to store states

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<UserDataCubit>();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AddressFormCubit, AddressFormState>(
      builder: (context, state) {
        final cubit = context.read<AddressFormCubit>();
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            cubit.resetState();
          },
          child: Scaffold(
            //         bottomSheet:  Stack(
            //   children: [
            //     Container(
            //       color: Colors.white,
            //       height: 56.0, // Set the height according to your design
            //     ),
            //     Positioned(
            //       bottom: 0,
            //       right: 0,
            //       child:             Container(
            //           color: Colors.white,
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 16.0, vertical: 16.0),
            //             child: state.isFormValid
            //                 ? CustomButton(
            //                     onTap: () async {
            //                       final otherDetailsFormCubit =
            //                           context.read<AddressFormCubit>();
            //                       final AddressFormState currentState =
            //                           otherDetailsFormCubit.state;

            //                       String? selectedStateId = statesList
            //                           .firstWhere((element) =>
            //                               element['label'] ==
            //                               currentState.countryDropdown)
            //                           .putIfAbsent('id', () => '');
            //                           print(selectedStateId);

            //                       final SharedPreferences prefs =
            //                           await SharedPreferences.getInstance();
            //                       await prefs.setString(
            //                           'stateId', selectedStateId ?? '');

            //                       Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (context) => const OtherDetailScreen(),
            //                         ),
            //                       );
            //                     },
            //                     text: 'Next',
            //                   )
            //                 : const InactiveButton(text: 'Next'),
            //           ),
            //         ),
            //     ),
            //   ],
            // ),

            appBar: CustomAppBar(
              title: 'New Customer Info',
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.resetState();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: (_isloadingpage&&_isLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Form(
                        key: CastleKeys.castleKey3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.headline(text: 'Address Details'),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              autoFocus: true,
                              controller: _addressController,
                              placeholder: 'Address1',
                              hintText:contact_detail_found? contactDetail?.email: 'Enter address1',
                              keyboardType: TextInputType.streetAddress,
                              maxLength: 30,
                              onChanged: (value) {
                                cubit.onChangedAddress(value);
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('address1', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.addressValidator(value),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              showrequired: false,
                              placeholder: 'Address2',
                              hintText: 'Enter address2',
                              keyboardType: TextInputType.streetAddress,
                              maxLength: 30,
                              onChanged: (value) {
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('address2', value);
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _cityController,
                              placeholder: 'City',
                              hintText: contact_detail_found? contactDetail?.city:'Enter city',
                              onChanged: (value) {
                                cubit.onChangedCity(value);
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('city', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.cityValidator(value),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              maxLength: 5,
                              placeholder: 'Zip code',
                              hintText: 'Enter Zip code',
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                cubit.onChangedZipCode(value);
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('zipCode', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.zipCodeValidator(value),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            DropdownSelector(
                              dropdownValue: state.countryDropdown,
                              hintText: 'Select state',
                              width: size.width + 32,
                              placeholder: 'State',
                              items: statesList
                                  .map((state) => state['label'] ?? '')
                                  .toList(),
                              onChanged: (value) {
                                cubit.onChangedCountryDropdown(value!);
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('country', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.dropdownValidator(value),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  height: size.height *
                                      0.062, // Set the height according to your design
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: state.isFormValid
                                          ? CustomButton(
                                              onTap: () async {
                                                cubit.onChangedAddress(
                                                    _addressController.text);
                                                context
                                                    .read<UserDataCubit>()
                                                    .updateUserData(
                                                        'address1',
                                                        _addressController
                                                            .text);
                                                cubit.onChangedCity(
                                                    _cityController.text);
                                                context
                                                    .read<UserDataCubit>()
                                                    .updateUserData('city',
                                                        _cityController.text);
                                                final otherDetailsFormCubit =
                                                    context.read<
                                                        AddressFormCubit>();
                                                final AddressFormState
                                                    currentState =
                                                    otherDetailsFormCubit.state;

                                                String?
                                                    selectedStateId = statesList
                                                        .firstWhere((element) =>
                                                            element['label'] ==
                                                            currentState
                                                                .countryDropdown)
                                                        .putIfAbsent(
                                                            'id', () => '');

                                                final SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                await prefs.setString(
                                                    'stateId', selectedStateId);

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const OtherDetailScreen(),
                                                  ),
                                                );
                                              },
                                              text: 'Next',
                                            )
                                          : const InactiveButton(text: 'Next'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    CastleKeys.castleKey3.currentState?.dispose();
    super.dispose();
  }

  getUserDetail() async {
    Map<String, String> userData = await MySharedPreferences.getUserData();
    _addressController.text = userData[SharedPreferencesKeys.addressKey] ?? '';
    _cityController.text = userData[SharedPreferencesKeys.cityKey] ?? '';
  }

  @override
  void initState() {
    getUserDetail();
    super.initState();
    loadStatesList();
  }

  void loadStatesList() async {
    try {
      statesList = await ApiService.fetchStatesList();
      if (mounted) {
        setState(() {
          _isloadingpage = false;
        }); // Update the state to rebuild the widget
      }
    } catch (e) {
      print('Error loading states list: $e');
    }
  }
}
