import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/api_integration/data_model/how_heard_type_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/core/utils/global_key_constant.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/cubit/form_validation_cubit/other_detail_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/cubit/form_validation_cubit/other_detail_form_state.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/widget/date_picker.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/widget/notes_textfiled.dart';
import 'package:castle_couture/presentation/d_customer_info/d_payment__details/payment_detail_screen.dart';
import 'package:castle_couture/presentation/d_customer_info/e_date_time/date_time_screen.dart';
import 'package:castle_couture/presentation/payments/payment_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherDetailScreen extends StatefulWidget {
  const OtherDetailScreen({super.key});

  @override
  State<OtherDetailScreen> createState() => _OtherDetailScreenState();
}

class _OtherDetailScreenState extends State<OtherDetailScreen> {
  final TextEditingController _eventPickerController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();
  List<HowHeardType> howHeardOptions = [];

  List<String> howHeardDescriptions = [];
  List<String> stylistDescriptions = [];
  bool isLoading = true;
  bool isloadingbutton = false;
  bool? requirepaymentinforforbooking;
  @override
  Widget build(BuildContext context) {
    final userDataCubit = context.read<UserDataCubit>();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<OtherDetailsFormCubit, OtherDetailFormState>(
      builder: (context, state) {
        final cubit = context.read<OtherDetailsFormCubit>();
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
            //       child: isloadingbutton
            //           ? const Center(
            //               child: CircularProgressIndicator(),
            //             )
            //           : Container(
            //               color: Colors.white,
            //               child: Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 16.0, vertical: 8.0),
            //                   child: state.isFormValid
            //                       ? CustomButton(
            //                           onTap: _createContactAndNavigate,
            //                           text: 'Next',
            //                         )
            //                       : const InactiveButton(text: 'Next')),
            //             ),
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
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Form(
                        // key: CastleKeys.castleKey4,
                        key: CastleKeys.castleKey4,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.headline(text: 'Other Details'),
                            const SizedBox(height: 10),
                            DropdownSelector(
                              margin: const EdgeInsets.all(0),
                              dropdownValue: state.howHeardDropdown,
                              placeholder: 'How heard',
                              hintText: 'How did you heard',
                              items: howHeardDescriptions,
                              onChanged: (value) {
                                cubit.onChangedHowHeardDropdown(value!);
                              },
                              validator: (value) =>
                                  ValidatorRegex.dropdownValidator(value),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              onTap: _updateEvent,
                              controller: _eventPickerController,
                              keyboardType: TextInputType.datetime,
                              placeholder: 'Event date',
                              hintText: 'mm/dd/yyyy',
                              readOnly: true,
                              maxLines: 1,
                              onChanged: (value) =>
                                  cubit.onChangedEventDate(value),
                              validator: (value) =>
                                  ValidatorRegex.dateValidator(value),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.number,
                              placeholder: 'Budget',
                              prefixIcon: const Icon(Icons.attach_money),
                              hintText: 'Add an amount',
                              contentPadding: EdgeInsets.only(
                                  top: 8.7.r, bottom: 8.5.r, right: 8.5.r),
                              maxLines: 1,
                              maxLength: 10,
                              onChanged: (value) {
                                cubit.onChangedBudget(value);
                                context
                                    .read<UserDataCubit>()
                                    .updateUserData('budget', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.budgetValidator(value),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            // DropdownSelector(
                            //   dropdownValue: state.stylistDropdown,
                            //   width: size.width,
                            //   placeholder: 'Stylist',
                            //   hintText: 'Select stylist',
                            //   items: ,
                            //   onChanged: (value) {
                            //     cubit.onChangedStylistDropdown(value!);
                            //   },
                            //   validator: (value) =>
                            //       ValidatorRegex.dropdownValidator(value),
                            // ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            NotesTextField(
                              controller: _notesController,
                              height: size.height * 0.20,
                              keyboardType: TextInputType.multiline,
                              placeholder:
                                  'Is there a specific stylist you would like to work with, or notes you would like us to know?',
                              hintText: 'Notes',
                              maxLines: 3,
                              maxLength: 500,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(500),
                              ],
                              counterText: state.notes != null
                                  ? '${state.notes!.length}/3000 characters'
                                  : '0/3000 characters',
                              onChanged: (value) {
                                cubit.onChangedNotes(value);
                                userDataCubit.updateUserData('notes', value);
                              },
                              validator: (value) =>
                                  ValidatorRegex.notesValidator(value),
                            ),
                            /*   Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomText.spanText(
                            text: '0/3000 characters',
                            color: CustomColors.liteBlack),
                      ),*/
                            const SizedBox(
                              height: 20,
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
                                  child: isloadingbutton
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Container(
                                          color: Colors.transparent,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                              ),
                                              child: state.isFormValid
                                                  ? CustomButton(
                                                      onTap:
                                                          _createContactAndNavigate,
                                                      text: 'Next',
                                                    )
                                                  : const InactiveButton(
                                                      text: 'Next')),
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
    CastleKeys.castleKey4.currentState?.dispose();
    super.dispose();
  }
  //   Future<void> fetchStylists() async {
  //   try {
  //     final List<Stylist> stylists = await ApiService.fetchStylistList();
  //     setState(() {
  //       stylistDescriptions =
  //           stylists.map((stylist) => stylist.description).toList();
  //       isLoadingStylists = false;
  //     });
  //   } catch (e) {
  //     print('Error fetching stylists: $e');
  //     // Handle error
  //   }
  // }

  Future<void> fetchHowHeardTypes() async {
    try {
      howHeardOptions = await ApiService.fetchHowHeardTypes();
      // Update howHeardDescriptions here after howHeardOptions is populated
      howHeardDescriptions =
          howHeardOptions.map((option) => option.description).toList();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          // Handle error or show a message
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchHowHeardTypes();
    //  fetchStylists();
  }

  Future<int?> mapHowHeardDescriptionToId(String howHeardDescription) async {
    try {
      if (howHeardOptions.isEmpty) {
        howHeardOptions = await ApiService.fetchHowHeardTypes();
      }

      HowHeardType selectedHowHeardType = howHeardOptions.firstWhere(
          (option) => option.description == howHeardDescription,
          orElse: () => HowHeardType(id: 12, description: 'ok', status: 'A'));

      return selectedHowHeardType.id;
    } catch (e) {
      print('Error mapping HowHeardDescription to ID: $e');
      return null;
    }
  }

  Future<void> _createContactAndNavigate() async {
    if (!mounted) return;

    setState(() {
      isloadingbutton = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? selectedAppointmentId =
        prefs.getString('selected_appointment_id');
    requirepaymentinforforbooking =
        prefs.getBool('requirepaymentinfoforbooking');
    final String eventDate = _eventPickerController
        .text; // Assuming this holds the event date in the desired format
    if (eventDate.isNotEmpty) {
      await prefs.setString('eventdate', eventDate);
    }

    if (!mounted) return;

    final otherDetailsFormCubit = context.read<OtherDetailsFormCubit>();
    final OtherDetailFormState currentState = otherDetailsFormCubit.state;

    String howHeardDescription = currentState.howHeardDropdown!;
    print(howHeardDescription);

    print(selectedAppointmentId);
    int? selectedHowHeardId =
        await mapHowHeardDescriptionToId(howHeardDescription);
    print(selectedHowHeardId);
    await prefs.setInt('selected_how_heard_id', selectedHowHeardId!);

    _navigateTopaymentscreen();

    setState(() {
      isloadingbutton = false;
    });
  }

  void _navigateTopaymentscreen() {
    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => requirepaymentinforforbooking!
            ? const PaymentScreen()
            : const DateTimeScreen(),
      ),
    );
  }

  Future<void> _updateEvent() async {
    DateTime? pickedEvent = await DatePickerController.pickEvent(context);

    if (pickedEvent != null && pickedEvent != DateTime.now()) {
      _eventPickerController.text =
          "${pickedEvent.month}/${pickedEvent.day}/${pickedEvent.year}";
    }
  }
}
