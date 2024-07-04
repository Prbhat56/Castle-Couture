import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/api_integration/data_model/appointment_list_data_model.dart';
import 'package:castle_couture/api_integration/data_model/new_created_appointment_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/d_customer_info/e_date_time/logic/function_list.dart';
import 'package:castle_couture/presentation/d_customer_info/g_booked_appointment/booked_appoinment_screen.dart';
import 'package:castle_couture/widgets/custom_buttons/book_appointment_inactive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/book_appointment_custom_button.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({
    super.key,
  });

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  bool checkBox = false;
  bool isloadingbutton = false;
  int? phonenumbertype;

  bool _isloading = true;
  String termsAndConditions = '';
  List<int> _stylistIds = [];
  List<AppointmentList> _appointmentsForSelectedDate = [];
  Future<void> addIdToList(int id) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> existingList = prefs
            .getStringList('appointment_ids')
            ?.map((str) => int.parse(str))
            .toList() ??
        [];
    existingList.add(id);
    List<String> stringList = existingList.map((i) => i.toString()).toList();
    prefs.setStringList('appointment_ids', stringList);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Appointment Terms & Conditions',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Html(
                      data: termsAndConditions,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align items at the start of the cross axis
                    children: [
                      Checkbox(
                        activeColor: CustomColors.primaryStroke,
                        checkColor: Colors.white,
                        value: checkBox, // Use your state variable here
                        onChanged: (bool? value) {
                          setState(() {
                            checkBox = value ??
                                false; // Update your state variable accordingly
                          });
                        },
                        side: const BorderSide(
                            color:
                                CustomColors.liteBlack), // Custom border color
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkBox = !checkBox;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top:
                                    12.0), // Adjust for alignment with the checkbox
                            child: CustomText.bodyText(
                              text:
                                  'Please check this box to receive your appointment confirmation via SMS and Email. If you do not check this box, you will not receive an automated appointment confirmation.',
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: isloadingbutton
                                  ? const CircularProgressIndicator()
                                  : checkBox
                                      ? BookAppointmentCustomButton(
                                          onTap: _bookAppointment,
                                          text: 'Next',
                                        )
                                      : const BookedAppointmentInactiveButton(
                                          text: 'Next')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchTermsAndConditions();
    // _fetchStylistIds();
  }

  Future<void> _bookAppointment() async {
    if (!mounted) return;
    setState(() {
      isloadingbutton = true;
    });
 

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // final String? formattedDateTime = prefs.getString('selectedDateTime');
      // print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn$formattedDateTime");
      // DateTime.parse(formattedDateTime!);

      // Format the DateTime object into the desired format

 

      final String? selectedAppointmentId =
          prefs.getString('selected_appointment_id');
      prefs.getString('appointment_type_description');
      final int? updatedduratrion = prefs.getInt('appointment_type_duration');
      final String? phonetype = prefs.getString('phonenumbertype');
      if (phonetype == 'Home') {
        phonenumbertype = 1;
      }
      if (phonetype == 'Mobile') {
        phonenumbertype = 3;
      }
      if (phonetype == 'Phone') {
        phonenumbertype = 2;
      }
      final String? eventdate = prefs.getString('eventdate');
      String? state = prefs.getString("stateId");

      // print("formatteddatetime-$formattedDateTime");
      // final int newformatteddatetime =
      //     DateTime.parse(formattedDateTime).millisecondsSinceEpoch;
      // print("new formatteddatetime=$newformatteddatetime");

      final int? howheardid = prefs.getInt('selected_how_heard_id');
      int? fittingroomid = prefs.getInt('selected_fitting_room_id');
      //
         int? mcstartdatetime = prefs.getInt('selected_start_date_time');
           int? mcenddatetime = prefs.getInt('selected_end_date_time');
           print("mctyuikk${mcstartdatetime.toString()}");





      // String? selectedtime = prefs.getString('selectedtimehere');
      String? selecteddate = prefs.getString('selecteddatehere');
      final int? currentduration = prefs.getInt('appointment_type_duration');
      // DateTime selectedDate = DateTime.parse(selecteddate!);
    
      // DateTime selectedDateTime =
      //     FunctionListForCalendarPage.newtypeformatDateTime(
      //         selectedDate, selectedtime!);
   

      // DateTime selectedstartdatetime =
      //     selectedDateTime.subtract(const Duration(hours: 5, minutes: 30));
      // print("selected start date time     $selectedstartdatetime");
      // final int newselectedstartdatetime =
      //     selectedstartdatetime.millisecondsSinceEpoch;

      // print("new selected stqrt date time in int $newselectedstartdatetime");
      // int updatedenddatetime = newselectedstartdatetime + currentduration!;
      // print("updated end date time in int $updatedenddatetime");

     

      final userDataCubit = context.read<UserDataCubit>();

      String firstName = userDataCubit.getUserData('firstName');
      String lastName = userDataCubit.getUserData('lastName');
      String emailAddress = userDataCubit.getUserData('email');
      String phoneNumber = userDataCubit.getUserData('phonenumber');
      String city = userDataCubit.getUserData('city');
      String address1 = userDataCubit.getUserData('address1');
      String address2 = userDataCubit.getUserData('address2');
      String zipCode = userDataCubit.getUserData('zipCode');
      String budget = userDataCubit.getUserData('budget');
      String? notes = userDataCubit.getUserData('notes');
      String? cardname = userDataCubit.getUserData('cardname');
      String? cardnumber = userDataCubit.getUserData('cardnumber');
      String? expirymonth = userDataCubit.getUserData('expirymonth');
      String? expiryyear = userDataCubit.getUserData('expireyear');
      String? cvv = userDataCubit.getUserData('cvv');

      if (selectedAppointmentId == null) {
        throw Exception(
            'User ID, appointment ID, or selected date time not fnd.');
      }

      if (fittingroomid == null) {
        throw Exception('Fitting room is not provided.');
      }
    

      MappedAppointment appointment = await ApiService.createAppointment(
          appointmenttypeid: int.parse(selectedAppointmentId),
          // starttime: formattedDateTime,
          // endtime: formattedDateTime,
          fittingRoomId: fittingroomid,
          // startDateTime: "$newformatteddatetime",
           startDateTime: mcstartdatetime.toString(),
          // endDateTime: "$newformatteddatetime",
           endDateTime: mcenddatetime.toString(),
          eventDate: eventdate ?? "2024-02-29T11:08:26.544Z",
          notes: notes,
          firstName: firstName,
          lastName: lastName,
          city: city,
          address1: address1,
          address2: address2,
          zip: zipCode,
          email: emailAddress,
          phone: phoneNumber,
          budget: budget,
          state: state ?? "Alabama",
          numberofpeople: '2',
          howheardid: howheardid ?? 7333,
          selecteddate: selecteddate ?? "04/03/2024",
          emailoptin: checkBox,
          smsoptin: checkBox,
          duration: currentduration!,
          cardnumber: cardnumber,
          cardname: cardname,
          expire: "$expirymonth/$expiryyear",
          phonetype: phonenumbertype ?? 0);

      await prefs.remove('selectedStylistId');
      await addIdToList(appointment.id);

      final List<String>? updatedAppointmentIds =
          prefs.getStringList('appointment_ids');
      print("Updated list of appointment IDs: $updatedAppointmentIds");
      await prefs.setInt('user_id', appointment.contactId);
      print("eeeeeeeeeee ${appointment.contactId}");

      _navigateToBookAppointmentScreen();
    } catch (e) {
      print('Failed to book appointment: $e');
      if (mounted) {
        if (e.toString().contains('Fitting room is not provided.') ||
            e.toString().contains('You cannot book appointment at this time')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
          Navigator.pop(context); // Navigate back to the previous screen
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to book appointment: $e')),
          );
        }
      }
    } finally {
      setState(() => isloadingbutton = false);
    }
  }




  Future<void> _fetchTermsAndConditions() async {
    setState(() {
      _isloading = true;
    });

    try {
      String termsAndConditions =
          await ApiService.fetchAdditionalDetailsDescription();

      setState(() {
        this.termsAndConditions = termsAndConditions;
      });
    } catch (e) {
      print('Failed to fetch terms and conditions: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch terms and conditions: $e')),
      );
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  void _navigateToBookAppointmentScreen() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment booked successfully')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BookedAppointmentScreen(),
      ),
    );
  }
}
