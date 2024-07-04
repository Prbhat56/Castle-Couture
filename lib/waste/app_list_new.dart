//import 'package:castle_couture/api_integration/api_service/api_service.dart';
//import 'package:castle_couture/api_integration/data_model/appointment_new_type.dart';
//import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
//import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';
//import 'package:castle_couture/widgets/custom_buttons/custom_button.dart';
//import 'package:castle_couture/widgets/custom_buttons/inactive_button.dart';
//import 'package:flutter/material.dart';

//class AppoitmentScreen extends StatefulWidget {
//  @override
//  _AppointmentScreenState createState() => _AppointmentScreenState();
//}

//class _AppointmentScreenState extends State<AppoitmentScreen> {
//  String? selectedAppointmentId; // Variable to hold the selected ID
//  bool _isButtonEnabled =
//      false; // Variable to control button enable/disable state

//  // Variable to hold the subtitle of selected expansion tile
//  String? selectedSubtitle;

//  // Dummy titles and subtitles with required number of descriptions
//  final List<Map<String, dynamic>> titlesAndSubtitles = [
//    {
//      "title": "Accessories",
//      "subtitle":
//          'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//      "count": 2
//    },
//    {
//      "title": "Bridal Package",
//      "subtitle":
//          'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//      "count": 5
//    },
//    {
//      "title": "Crown Room",
//      "subtitle":
//          'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
//      "count": 3
//    },
//    {
//      "title": "Evening Wear",
//      "subtitle":
//          'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
//      "count": 2
//    },
//    {"title": "Prom", "subtitle": "Variety of options", "count": 3},
//    {
//      "title": "Pickup",
//      "subtitle":
//          'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
//      "count": 3
//    },
//  ];

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: CustomAppBar(
//        title: 'Select an Appointment',
//        centerTitle: true,
//        leading: IconButton(
//          onPressed: () => Navigator.pop(context),
//          icon: const Icon(Icons.arrow_back),
//        ),
//      ),
//      body: FutureBuilder<List<AppointmentNewType>>(
//        future: ApiService.fetchAppointmentTypes(),
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//            return CircularProgressIndicator();
//          } else if (snapshot.hasError) {
//            return Text('Error: ${snapshot.error}');
//          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//            return Text('No appointments found');
//          } else {
//            List<AppointmentNewType> appointments = snapshot.data!;
//            int startIndex = 0;

//            return ListView.builder(
//              itemCount: titlesAndSubtitles.length,
//              itemBuilder: (context, index) {
//                var titleAndSubtitle = titlesAndSubtitles[index];
//                int count =
//                    titleAndSubtitle["count"] ?? 0; // Default to 0 if null
//                int endIndex = startIndex + count;
//                endIndex = endIndex > appointments.length
//                    ? appointments.length
//                    : endIndex;
//                List<AppointmentNewType> appointmentsForTile =
//                    appointments.sublist(startIndex, endIndex);

//                startIndex = endIndex;

//                return ExpansionTile(
//                  title: Text(titleAndSubtitle["title"]),
//                  subtitle: Text(titleAndSubtitle["subtitle"]),
//                  children: appointmentsForTile.map((appointment) {
//                    return ListTile(
//                      title: Text(appointment.description),
//                      trailing: Radio<String>(
//                        value: appointment.id,
//                        groupValue: selectedAppointmentId,
//                        onChanged: (String? value) {
//                          setState(() {
//                            selectedAppointmentId = value;
//                            selectedSubtitle = titleAndSubtitle["subtitle"];
//                            _isButtonEnabled = true;
//                          });
//                        },
//                      ),
//                    );
//                  }).toList(),
//                );
//              },
//            );
//          }
//        },
//      ),
//      bottomNavigationBar: Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//        child: _isButtonEnabled
//            ? CustomButton(
//                onTap: () {
//                  if (selectedSubtitle != null &&
//                      selectedAppointmentId != null) {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => SelectedPackageScreen(
//                          selectedAppointmentId: selectedAppointmentId!,
//                          subtitle: selectedSubtitle!,
//                        ),
//                      ),
//                    );
//                  }
//                },
//                text: 'Next',
//              )
//            : const InactiveButton(text: 'Next'),
//      ),
//    );
//  }
//}




//===>>> this is previous save and navigate function 

//Future<void> _saveAndNavigate() async {
//  setState(() {
//    _isloadingbutton = true; // Show circular progress indicator
//  });

//  final SharedPreferences prefs = await SharedPreferences.getInstance();
//  int? fittingroomid = prefs.getInt('selectedStylistId');
//  prefs.setString('selectedtimehere', finalAvailableTimes[_selectIndex]);
//  String selectedDateString = DateFormat('yyyy-MM-dd').format(_selectedDate!);


//  prefs.setString('selecteddatehere', selectedDateString);

//  print(finalAvailableTimes[_selectIndex]);

//  // Await the completion of newtypeofstylishids
//  await newtypeofstylishids(
//      _selectedDate!, finalAvailableTimes[_selectIndex]);
//  print(_selectedDate);
//  print(_selectIndex);
//        DateTime selectedDate = DateTime.parse(selectedDateString);
//      final response = await ApiService.fetchAppointmentsList();
//      final List<dynamic> allAppointments = response['result'];
//      DateTime selectedDateTime =
//          _newtypeformatDateTime(selectedDate, finalAvailableTimes[_selectIndex]);
//     List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
//          .map((json) => AppointmentList.fromJson(json))
//          .where((appointment) => isSameDay(selectedDateTime,
//              DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
//          .toList();
//                final int? currentduration = prefs.getInt('appointment_type_duration');
          
//             DateTime selectedstartdatetime =
//          selectedDateTime.subtract(const Duration(hours: 5, minutes: 30));
//          final int newselectedstartdatetime =
//          selectedstartdatetime.millisecondsSinceEpoch;
//           int updatedenddatetime = newselectedstartdatetime + currentduration!;
//      List<AppointmentList> appointmentsforstartandenddatetime =
//          appointmentsForSelectedDateTime
//              .where((appointment) =>
//                  appointment.startDateTime == newselectedstartdatetime &&
//                  appointment.endDateTime == updatedenddatetime &&
//                  appointment.fittingRoomId == fittingroomid)
//              .toList();

//  if (_selectedDate != null && _selectIndex != -1 && _isStylistIdsFiltered &&appointmentsforstartandenddatetime.length ==null&&fittingroomid!=null) {
//    DateTime formattedDateTime =
//        _newformatDateTime(_selectedDate!, finalAvailableTimes[_selectIndex]);

//    // Save to local storage
//    String newformatteddatetime = formattedDateTime.toString();
//    await prefs.setString('selectedDateTime', newformatteddatetime);
//    print(formattedDateTime);

//    print(DateTime.parse(newformatteddatetime)
//        .millisecondsSinceEpoch
//        .toString());

//    // Navigate to next page
//    if (mounted) {
//      Navigator.push(context,
//          MaterialPageRoute(builder: (context) => const TermConditionScreen()));
//    }
//  }
//  else{
    
//  }

//  setState(() {
//    _isloadingbutton = false; // Hide circular progress indicator
//  });
//}