import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/api_integration/data_model/new_contact_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_data.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_keys.dart';
import 'package:castle_couture/presentation/d_customer_info/b_address_details/address_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/global_key_constant.dart';
import 'cubit/form_validation_cubit/personal_detail_form_cubit.dart';
import 'cubit/form_validation_cubit/personal_detail_form_state.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  bool  _isLoading=true;
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
    _firstNameController.text = contactDetail?.firstname ?? '';
    _lastNameController.text = contactDetail?.lastname ?? '';
    _emailController.text = contactDetail?.email ?? '';
    _mobileController.text = contactDetail?.bestphonenumber ?? '';
  
  }


  late PersonalDetailFormCubit otherDetailsFormCubit;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userDataCubit = context.read<UserDataCubit>();
    Size size = MediaQuery.of(context).size;
    String phonenumbertype = otherDetailsFormCubit.state.mobileDropdown!;
    return BlocBuilder<PersonalDetailFormCubit, PersonalDetailFormState>(
      builder: (context, state) {
        final cubit = context.read<PersonalDetailFormCubit>();

        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            cubit.resetState();
          },
          child: Scaffold(
            // bottomSheet: Stack(
            //   children: [
            //     Container(
            //       color: Colors.white,
            //       height: 56.0, // Set the height according to your design
            //     ),
            //     Positioned(
            //       bottom: 0,
            //       right: 0,
            //       child: Container(
            //         color: Colors.white,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 16.0, vertical: 8.0),
            //           child: state.isFormValid
            //               ? CustomButton(
            //                   onTap: () async {
            //                     final SharedPreferences prefs =
            //                         await SharedPreferences.getInstance();
            //                     await prefs.setString(
            //                         'phonenumbertype', phonenumbertype);
            //                     print(phonenumbertype);
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) =>
            //                             const AddressDetailScreen(),
            //                       ),
            //                     );
            //                   },
            //                   text: 'Next',
            //                 )
            //               : const InactiveButton(text: 'Next'),
            //         ),
            //       ),,
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
            body: _isLoading?Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Form(
                  key: CastleKeys.castleKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.headline(text: 'Personal Details'),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        autoFocus: true,
                        controller: _firstNameController,
                        placeholder: 'First name',
                        hintText: contact_detail_found? contactDetail?.firstname:'Enter first name',
                        onChanged: (value) {
                          cubit.onChangedFirstName(value);
                          userDataCubit.updateUserData('firstName', value);
                        },
                        validator: (value) =>
                            ValidatorRegex.nameValidator(value),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _lastNameController,
                        placeholder: 'Last name',
                        hintText:  contact_detail_found? contactDetail?.lastname:'Enter last name',
                        onChanged: (value) {
                          cubit.onChangedLastName(value);
                          userDataCubit.updateUserData('lastName', value);
                        },
                        validator: (value) =>
                            ValidatorRegex.nameValidator(value),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DropdownSelector(
                              dropdownValue: state.mobileDropdown,
                              width: size.width * 0.44,
                              hintText: 'Mobile',
                              placeholder: 'Phone number type ',
                              items: const ['Mobile', 'Phone', 'Home'],
                              onChanged: (value) {
                                cubit.onChangedMobileDropdown(value!);
                                userDataCubit.updateUserData(
                                    'phoneType', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.dropdownValidator(value),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFormField(
                                  controller: _mobileController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  placeholder: 'Phone number',
                                  hintText: contact_detail_found? contactDetail?.bestphonenumber:'1234567890',
                                  width: size.width * 0.44,
                                  onChanged: (value) {
                                    cubit.onChangedPhoneNumber(value);
                                    userDataCubit.updateUserData(
                                        'phonenumber', value);
                                  },
                                  validator: (value) =>
                                      ValidatorRegex.mobileNumberValidator(
                                          value),
                                ),
                                // Add error text for TextFormField here if needed
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _emailController,
                        placeholder: 'Email ID',
                        hintText:contact_detail_found? contactDetail?.email: 'Enter email ID',
                        onChanged: (value) {
                          cubit.onChangedEmail(value);
                          userDataCubit.updateUserData('email', value);
                        },
                        validator: (value) =>
                            ValidatorRegex.emailValidator(value),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: CustomColors.primaryStroke,
                            checkColor: Colors.white,
                            value: state.isCheckboxValid,
                            onChanged: (bool? value) {
                              cubit.onChangedFirstName(
                                  _firstNameController.text);
                              userDataCubit.updateUserData(
                                  'firstName', _firstNameController.text);
                              cubit.onChangedLastName(_lastNameController.text);
                              userDataCubit.updateUserData(
                                  'lastName', _lastNameController.text);
                              cubit.onChangedEmail(_emailController.text);
                              userDataCubit.updateUserData(
                                  'email', _emailController.text);
                              cubit
                                  .onChangedPhoneNumber(_mobileController.text);
                              userDataCubit.updateUserData(
                                  'phonenumber', _mobileController.text);

                              cubit.onChangedMobileDropdown('Mobile');
                              userDataCubit.updateUserData(
                                  'phoneType', 'Mobile');

                              cubit.onChangedCheckBox(value ?? false);
                            },
                            side: const BorderSide(
                                color: CustomColors
                                    .liteBlack), // Custom border color
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                               if(contact_detail_found)
                                cubit.onChangedCheckBox(!state.isCheckboxValid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: CustomText.spanText(
                                  text:
                                      'Please check this box to receive your appointment confirmation via SMS and Email. If you do not check this box, you will not receive an automated appointment confirmation.',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: size.height * 0.062,
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
                                child: (state.isFormValid ||contact_detail_found)?
                                     CustomButton(
                                        onTap: () async {
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.setString(
                                              'phonenumbertype',
                                              phonenumbertype);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddressDetailScreen(),
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
    CastleKeys.castleKey2.currentState?.dispose();
    super.dispose();
  }

  getUserDetail() async {
    Map<String, String> userData = await MySharedPreferences.getUserData();
    _firstNameController.text =
        userData[SharedPreferencesKeys.firstNameKey] ?? '';
    _lastNameController.text =
        userData[SharedPreferencesKeys.lastNameKey] ?? '';
    _emailController.text = userData[SharedPreferencesKeys.emailKey] ?? '';
    _mobileController.text =
        userData[SharedPreferencesKeys.mobileNumberKey] ?? '';
  }

  @override
  void initState() {
    getUserDetail();
    
    _fetchContactDetail();
    super.initState();
    otherDetailsFormCubit = context.read<PersonalDetailFormCubit>();
  }
}
