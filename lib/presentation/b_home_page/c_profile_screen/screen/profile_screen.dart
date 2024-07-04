import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/new_contact_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_data.dart';
import 'package:castle_couture/core/utils/share_preference/share_preference_keys.dart';
import 'package:castle_couture/presentation/b_home_page/c_profile_screen/cubit/profile_form_cubit.dart';
import 'package:castle_couture/presentation/b_home_page/c_profile_screen/cubit/profile_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/global_key_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = true;

  MappedContact? contactDetail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFormCubit, ProfileFormState>(
      builder: (context, state) {
        final cubit = context.read<ProfileFormCubit>();
        return Scaffold(
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              //: contactDetail == null
              //    ? const Center(
              //        child: Text('No data is found to update.'),
              //      )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Form(
                      key: CastleKeys.castleKey6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            controller: _firstNameController,
                            placeholder: 'First name',
                            hintText: contactDetail?.firstname ?? 'First name',
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              cubit.onChangedFirstName(value);
                            },
                            validator: (value) =>
                                ValidatorRegex.nameValidator(value),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _lastNameController,
                            keyboardType: TextInputType.name,
                            placeholder: 'Last name',
                            hintText: contactDetail?.lastname ?? 'Last name',
                            onChanged: (value) {
                              cubit.onChangedLastName(value);
                            },
                            validator: (value) =>
                                ValidatorRegex.nameValidator(value),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _cityController,
                            keyboardType: TextInputType.text,
                            placeholder: 'City',
                            hintText: contactDetail?.city ?? 'City',
                            maxLines: 1,
                            onChanged: (value) =>
                                cubit.onChangedDateOfBirth(value),
                            validator: (value) =>
                                ValidatorRegex.cityValidator(value),
                          ),
                          // CustomTextFormField(
                          //   onTap: readOnly ? null : _updateDob,
                          //   controller: _cityController,
                          //   keyboardType: TextInputType.datetime,
                          //   placeholder: 'Date of Birth',
                          //   hintText: 'mm/dd/yyyy',
                          //   readOnly: readOnly,
                          //   maxLines: 1,
                          //   onChanged: (value) => cubit.onChangedDateOfBirth(value),
                          //   validator: (value) => ValidatorRegex.dobValidator(value),
                          // ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _mobileController,
                            placeholder: 'Mobile Number',
                            hintText:
                                contactDetail?.bestphonenumber ?? "8987654321",
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                cubit.onChangedMobileNumber(value),
                            validator: (value) =>
                                ValidatorRegex.mobileNumberValidator(value),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _emailController,
                            placeholder: 'Email ID',
                            hintText: contactDetail?.email ?? 'Email ID',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              cubit.onChangedEmail(value);
                            },
                            validator: (value) =>
                                ValidatorRegex.emailValidator(value),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomTextFormField(
                            controller: _addressController,
                            placeholder: 'Address',
                            hintText: contactDetail?.address1 ?? 'Address',
                            keyboardType: TextInputType.streetAddress,
                            maxLength: 30,
                            onChanged: (value) {
                              cubit.onChangedAddress(value);
                            },
                            validator: (value) =>
                                ValidatorRegex.addressValidator(value),
                          ),
                          state.isFormValid
                              ? const SizedBox(height: 10)
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: state.isFormValid
                                ? InkWell(
                                    onTap: _saveContactDetails,
                                    child: CustomText.subHeadingText(
                                      text: 'Save',
                                    ),
                                  )
                                : CustomText.spanText(text: 'Save'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
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
    _addressController.text = userData[SharedPreferencesKeys.addressKey] ?? '';
    _cityController.text = userData[SharedPreferencesKeys.cityKey] ?? '';
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
    _fetchContactDetail();
  }

  loadUserDeails() {
    _firstNameController.text = contactDetail?.firstname ?? '';
    _lastNameController.text = contactDetail?.lastname ?? '';
    _emailController.text = contactDetail?.email ?? '';
    _mobileController.text = contactDetail?.bestphonenumber ?? '';
    _addressController.text = contactDetail?.address1 ?? '';
    _cityController.text = contactDetail?.city ?? '';
  }

  Future<void> savePersonalDetail() async {
    await MySharedPreferences.saveUserData(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      city: _cityController.text,
      email: _emailController.text,
      mobileNumber: _mobileController.text,
      address: _addressController.text,
    );
  }

  Future<void> _fetchContactDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int contactId = prefs.getInt('user_id') ?? 0;

    if (contactId != 0) {
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

  Future<void> _saveContactDetails() async {
    setState(() {
      _isLoading = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int contactId = prefs.getInt('user_id') ?? 0;
    try {
      Response response;
      if (contactDetail != null) {
        response = await ApiService.updateContact(
          contactId: contactId,
          typeId: 0,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          emailAddress: _emailController.text,
          homePhoneNumber: _mobileController.text,
          workPhoneNumber: _mobileController.text,
          mobilePhoneNumber: _mobileController.text,
          address1: _addressController.text,
          address2: _addressController.text,
          city: _cityController.text,
        );
        savePersonalDetail();

        print("respnse     ${response.body}   ${response.statusCode}");
        if (response.statusCode == 200) {
          setState(() {});
          await _fetchContactDetail();
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contact updated successfully')),
          );
        }
      } else {
        savePersonalDetail();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Contact updated successfully')),
        );
      }
    } catch (e) {
      debugPrint("Failed to fetch data $e");
    }

    setState(() {
      _isLoading = false;
    });
  }
}
