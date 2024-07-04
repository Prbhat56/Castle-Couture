// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/appointment_list_data_model.dart';
// import 'package:castle_couture/api_integration/data_model/available_time_slot_data_model.dart';
// import 'package:castle_couture/api_integration/data_model/date_available_data_model.dart';
// import 'package:castle_couture/core/app_export.dart';
// import 'package:castle_couture/presentation/d_customer_info/e_date_time/widget/custom_error_dialog.dart';
// import 'package:castle_couture/presentation/d_customer_info/f_term_condition/term_condition_screen.dart';

// import 'package:castle_couture/widgets/custom_color/custom_colors.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:table_calendar/table_calendar.dart';

// class DateTimeScreen extends StatefulWidget {
//   const DateTimeScreen({super.key});

//   @override
//   State<DateTimeScreen> createState() => _DateTimeScreenState();
// }

// class _DateTimeScreenState extends State<DateTimeScreen> {
//   DateTime _lastAllowedDay = DateTime.now().add(const Duration(days: 120));
//   DateTime _focusedDay = DateTime.now();
//   Map<CalendarFormat, String> availableCalendarFormats = {
//     CalendarFormat.month: 'Month',
//     //CalendarFormat.week: 'Week',
//   };
//   List<DateAvailable> _blackoutDates = [];
//   bool _isLoading = true;
//   int appointment_type_id = 0;
//   bool _isloadingtime = false;
//   final List<String> times = [];
//   List<int> _stylistIds = [];
//   bool _isloadingbutton = false;
//   List<AppointmentList> _appointmentsForSelectedDate = [];
//   bool foundAvailableSlot = false;
//   bool showtimeerror = false;
//   bool showspecifictimeerror = false;
//   List<String> finalAvailableTimes = [];
//   bool showblockerror = false;
//   bool _isTimeFiltered = false;
//   bool _isStylistIdsFiltered = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusedDay = DateTime.now();
//     _selectedDate = _focusedDay;
//     DateTime startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
//     DateTime endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
//     _fetchBlackoutDates(startDate, endDate);
//     _lastAllowedDay = DateTime(_focusedDay.year, _focusedDay.month + 3, 0);
//     // _fetchStylistIds();
//     _fetchAppointmentDetailsAndStylistIds();
//     _isStylistIdsFiltered = false;
//   }

//   Future<void> _fetchAppointmentDetailsAndStylistIds() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? appointmentTypeDescription =
//           prefs.getString('appointment_type_description');
//       if (appointmentTypeDescription == null) {
//         throw Exception(
//             'Appointment type description not found in local storage');
//       }
//       print(appointmentTypeDescription);
//       final List<dynamic> appointmentBlocksResponse =
//           await ApiService.fetchAppointmentBlocksList();

//       Set<int> fittingRoomIdsSet = {};

//       for (var block in appointmentBlocksResponse) {
//         String blockAppointmentTypeDescription =
//             block['appointmentTypeDescription'];
//         int fittingRoomId = block['fittingRoomId'];

//         if (blockAppointmentTypeDescription == appointmentTypeDescription) {
//           fittingRoomIdsSet.add(fittingRoomId);
//         }
//       }

//       List<int> fittingRoomIds = fittingRoomIdsSet.toList();

//       setState(() {
//         _stylistIds = fittingRoomIds;
//         _isLoading = false;
//       });
//       print(fittingRoomIds);
//     } catch (e) {
//       print('Error fetching appointment details and stylist IDs: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   bool _isPastDate(DateTime day) {
//     return day.isBefore(DateTime.now());
//   }

//   bool _isFutureDate(DateTime day) {
//     return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
//   }

//   Future<void> _fetchBlackoutDates(DateTime startdate, DateTime enddate) async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       appointment_type_id =
//           int.parse(prefs.getString('selected_appointment_id') ?? '');

//       // Fetch available dates from the API
//       List<DateAvailable> fetchedDates = await ApiService.fetchAvailableDates(
//         appointment_type_id,
//         startdate,
//         enddate,
//       );

//       List<DateAvailable> blackoutDates =
//           fetchedDates.where((date) => !date.availableTimeSlot).toList();

//       setState(() {
//         _blackoutDates = blackoutDates;
//         _isLoading = false;
//       });

//       _blackoutDates.forEach((date) {
//         print("Blackout Date: Start - ${date.dateString}");
//       });
//     } catch (e) {
//       print("Error fetching blackout dates: $e");
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   DateTime parseTimeString(String timeString) {
//     return DateTime.parse('1970-01-01 ' + timeString);
//   }

//   DateTime parseTimeStringhello(String timeString) {
//     final parsedTime = DateFormat("hh:mma").parse(timeString);

//     final now = DateTime.now();

//     return DateTime(
//         now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);
//   }

//   int findTimeDifference(String startTimeString, String endTimeString) {
//     DateTime startTime = parseTimeStringhello(startTimeString);
//     DateTime endTime = parseTimeStringhello(endTimeString);

//     int differenceMilliseconds = endTime.difference(startTime).inMilliseconds;
//     return differenceMilliseconds;
//   }

//   int getDayInteger(String dayName) {
//     switch (dayName.toLowerCase()) {
//       case 'sunday':
//         return 1;
//       case 'monday':
//         return 2;
//       case 'tuesday':
//         return 3;
//       case 'wednesday':
//         return 4;
//       case 'thursday':
//         return 5;
//       case 'friday':
//         return 6;
//       case 'saturday':
//         return 7;
//       default:
//         return -1; // Return -1 for invalid input
//     }
//   }

//   Future<void> newtypeofstylishids(
//       DateTime selectedDate, String updatedtime) async {
//     try {
//       String dayName = DateFormat('EEEE').format(selectedDate);
//       print("Selected day: $dayName");
//       print("filtered stylist ids $_stylistIds");
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final int? currentduration = prefs.getInt('appointment_type_duration');

//       print("updatedtime jhj$updatedtime");
//       final response = await ApiService.fetchAppointmentsList();
//       final List<dynamic> allAppointments = response['result'];

//       DateTime selectedDateTime =
//           _newtypeformatDateTime(selectedDate, updatedtime);
//       List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
//           .map((json) => AppointmentList.fromJson(json))
//           .where((appointment) => isSameDay(selectedDateTime,
//               DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
//           .toList();
//       print("appointmentforselecteddatetime $appointmentsForSelectedDateTime");

//       DateTime selectedstartdatetime =
//           selectedDateTime.subtract(const Duration(hours: 5, minutes: 30));
//       print("selected start date time     $selectedstartdatetime");
//       final int newselectedstartdatetime =
//           selectedstartdatetime.millisecondsSinceEpoch;

//       print("new selected stqrt date time in int $newselectedstartdatetime");
//       int updatedenddatetime = newselectedstartdatetime + currentduration!;
//       print("updated end date time in int $updatedenddatetime");
//       for (int stylistId in _stylistIds) {
//         List<AppointmentList> appointmentsForStylist =
//             appointmentsForSelectedDateTime
//                 .where((appointment) => appointment.fittingRoomId == stylistId)
//                 .toList();
//         print("list of appointments after filtering $appointmentsForStylist");
//         if (appointmentsForStylist.isEmpty) {
//           final SharedPreferences prefs = await SharedPreferences.getInstance();
//           String? appointmentTypeDescription =
//               prefs.getString('appointment_type_description');
//           final List<dynamic> appointmentBlocksResponse =
//               await ApiService.fetchAppointmentBlocksList();
//           for (var block in appointmentBlocksResponse) {
//             String blockAppointmentTypeDescription =
//                 block['appointmentTypeDescription'];
//             int fittingRoomId = block['fittingRoomId'];

//             int dayofweek = block["dayOfWeek"];
//             int daynumber = getDayInteger(dayName);

//             if (blockAppointmentTypeDescription == appointmentTypeDescription &&
//                 fittingRoomId == stylistId &&
//                 daynumber == dayofweek) {
//               // Match found, get start time and end time
//               String startTime = block['startTime'];
//               String endTime = block['endTime'];

//               DateFormat dateFormat = DateFormat("h:mma");
//               DateTime startDateTime = dateFormat.parse(startTime);
//               DateTime endDateTime = dateFormat.parse(endTime);

//               // Convert updated time to 24-hour format
//               DateTime updatedstartDateTime = dateFormat.parse(updatedtime);
//               DateTime updatedDateTime = updatedstartDateTime
//                   .add(Duration(milliseconds: currentduration));

//               print("startdatetime $startDateTime");
//               print("enddatetime $endDateTime");
//               print("updatedstartdatetime $updatedstartDateTime");
//               print("updated end date tiem $updatedDateTime");

//               int startDateTimeMillis = startDateTime.millisecondsSinceEpoch;
//               int endDateTimeMillis = endDateTime.millisecondsSinceEpoch;
//               int updatedStartDateTimeMillis =
//                   updatedstartDateTime.millisecondsSinceEpoch;
//               int updatedEndDateTimeMillis =
//                   updatedDateTime.millisecondsSinceEpoch;

//               print('startdatetime $startDateTimeMillis');
//               print('enddatetime $endDateTimeMillis');
//               print('updatedstartdatetime $updatedStartDateTimeMillis');
//               print('updated end date time $updatedEndDateTimeMillis');

//               // Use start time and end time as needed
//               print(
//                   "this is gyuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhj");

//               if (updatedStartDateTimeMillis >= startDateTimeMillis &&
//                   updatedStartDateTimeMillis <= endDateTimeMillis &&
//                   updatedEndDateTimeMillis >= startDateTimeMillis &&
//                   updatedEndDateTimeMillis <= endDateTimeMillis) {
//                 prefs.remove('selectedStylistId');
//                 prefs.setInt('selectedStylistId', stylistId);
//                 print("Stylist ID $stylistId saved in local storage");
//                 return;
//               } else {
//                 continue;
//               }
//             }
//           }
//         } else {
//           bool isavailable = true;
//           for (AppointmentList appointment in appointmentsForStylist) {
//             int appointmentStart = appointment.startDateTime;
//             int appointmentEnd = appointment.endDateTime;
//             print("hello $appointmentStart");
//             print("motto $appointmentEnd");

//             if ((updatedenddatetime >= appointmentStart &&
//                     updatedenddatetime <= appointmentEnd) ||
//                 (newselectedstartdatetime >= appointmentStart &&
//                     newselectedstartdatetime <= appointmentEnd) ||
//                 appointmentStart == newselectedstartdatetime) {
//               isavailable = false;
//               break;
//             } else {
//               continue;
//             }
//           }
//           if (isavailable) {
//             DateTime updatedDateTime = DateFormat('hh:mma').parse(updatedtime);

//             final SharedPreferences prefs =
//                 await SharedPreferences.getInstance();
//             String? appointmentTypeDescription =
//                 prefs.getString('appointment_type_description');
//             final List<dynamic> appointmentBlocksResponse =
//                 await ApiService.fetchAppointmentBlocksList();
//             for (var block in appointmentBlocksResponse) {
//               String blockAppointmentTypeDescription =
//                   block['appointmentTypeDescription'];
//               int fittingRoomId = block['fittingRoomId'];

//               int dayofweek = block["dayOfWeek"];
//               int daynumber = getDayInteger(dayName);

//               if (blockAppointmentTypeDescription ==
//                       appointmentTypeDescription &&
//                   fittingRoomId == stylistId &&
//                   daynumber == dayofweek) {
//                 // Match found, get start time and end time
//                 String startTime = block['startTime'];
//                 String endTime = block['endTime'];

//                 DateFormat dateFormat = DateFormat("h:mma");
//                 DateTime startDateTime = dateFormat.parse(startTime);
//                 DateTime endDateTime = dateFormat.parse(endTime);

//                 // Convert updated time to 24-hour format
//                 DateTime updatedstartDateTime = dateFormat.parse(updatedtime);
//                 updatedDateTime = updatedstartDateTime
//                     .add(Duration(milliseconds: currentduration));

//                 print("startdatetime $startDateTime");
//                 print("enddatetime $endDateTime");
//                 print("updatedstartdatetime $updatedstartDateTime");
//                 print("updated end date tiem $updatedDateTime");

//                 int startDateTimeMillis = startDateTime.millisecondsSinceEpoch;
//                 int endDateTimeMillis = endDateTime.millisecondsSinceEpoch;
//                 int updatedStartDateTimeMillis =
//                     updatedstartDateTime.millisecondsSinceEpoch;
//                 int updatedEndDateTimeMillis =
//                     updatedDateTime.millisecondsSinceEpoch;

//                 print('startdatetime $startDateTimeMillis');
//                 print('enddatetime $endDateTimeMillis');
//                 print('updatedstartdatetime $updatedStartDateTimeMillis');
//                 print('updated end date time $updatedEndDateTimeMillis');

//                 // Use start time and end time as needed
//                 print(
//                     "this is gyuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhj");

//                 if (updatedStartDateTimeMillis >= startDateTimeMillis &&
//                     updatedStartDateTimeMillis <= endDateTimeMillis &&
//                     updatedEndDateTimeMillis >= startDateTimeMillis &&
//                     updatedEndDateTimeMillis <= endDateTimeMillis) {
//                   prefs.remove('selectedStylistId');
//                   prefs.setInt('selectedStylistId', stylistId);
//                   print("Stylist ID $stylistId saved in local storage");
//                   return;
//                 } else {
//                   continue;
//                 }
//               }
//             }

//             int? fittingroomid = prefs.getInt('selectedStylistId');
//             if (fittingroomid == null) {
//               CustomErrorDialog(
//                 title: "Error",
//                 content:
//                     "Fitting room cannot be assigned at this time. Please select another fitting room.",
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//               );
//             }
//           }
//         }
//       }
//     } catch (e) {
//       print(e.toString());
//     } finally {
//       setState(() {
//         _isloadingbutton = false;
//         _isStylistIdsFiltered = true;
//       });
//     }
//   }

//   Future<List<String>> fetchfinallistoftime(DateTime selectedDate) async {
//     try {
//       setState(() {
//         _isloadingtime = true;
//       });

//       List<String> availableTimes = await fetchAvailableTimesList(selectedDate);
//       print(availableTimes);
//       finalAvailableTimes.clear();

//       final response = await ApiService.fetchAppointmentsList();
//       final List<dynamic> allAppointments = response['result'];

//       for (int timeIndex = 0; timeIndex < availableTimes.length; timeIndex++) {
//         String time = availableTimes[timeIndex];
//         print(time);

//         DateTime selectedDateTime = _newtypeformatDateTime(selectedDate, time);
//         print(selectedDateTime);

//         DateTime newselecteddatetime = selectedDateTime;

//         List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
//             .map((json) => AppointmentList.fromJson(json))
//             .where((appointment) => isSameDay(newselecteddatetime,
//                 DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
//             .toList();

//         print("available $appointmentsForSelectedDateTime");
//         List<AppointmentList> appointmentForThatSpecificTime =
//             appointmentsForSelectedDateTime.where((appointment) {
//           DateTime startDateTime =
//               DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime);

//           String startTime = '${startDateTime.hour}:${startDateTime.minute}';
//           print('Start time: $startTime');

//           String selectedTime = availableTimes[timeIndex];
//           print('Selected time: $selectedTime');
//           DateTime firstselectedtime = DateFormat('h:mma').parse(selectedTime);
//           DateTime adjustedDateTime =
//               firstselectedtime.add(Duration(hours: 2, minutes: 30));
//           String adjustedTime24HourFormat =
//               DateFormat('HH:mm').format(adjustedDateTime);

//           print('Adjusted time (24-hour format): $adjustedTime24HourFormat');

//           bool isSameTimeResult = startTime == adjustedTime24HourFormat;

//           return isSameTimeResult;
//         }).toList();

//         print(
//             "appointmentforthatspecific time 56$appointmentForThatSpecificTime");

//         print(appointmentForThatSpecificTime.length);
//         print(_stylistIds.length);
//         print("stylist ids in time logic $_stylistIds");
//         bool isalltimefill = true;
//         for (int stylistId in _stylistIds) {
//           List<AppointmentList> appointmentwithspecifictimeandstlistids =
//               appointmentForThatSpecificTime
//                   .where(
//                       (appointment) => appointment.fittingRoomId == stylistId)
//                   .toList();

//           bool trythistime = false;
//           String dayName = DateFormat('EEEE').format(selectedDate);
//           final SharedPreferences prefs = await SharedPreferences.getInstance();
//           final int? currentduration =
//               prefs.getInt('appointment_type_duration');

//           String? appointmentTypeDescription =
//               prefs.getString('appointment_type_description');
//           final List<dynamic> appointmentBlocksResponse =
//               await ApiService.fetchAppointmentBlocksList();
//           for (var block in appointmentBlocksResponse) {
//             String blockAppointmentTypeDescription =
//                 block['appointmentTypeDescription'];
//             int fittingRoomId = block['fittingRoomId'];

//             int dayofweek = block["dayOfWeek"];
//             int daynumber = getDayInteger(dayName);

//             if (blockAppointmentTypeDescription == appointmentTypeDescription &&
//                 fittingRoomId == stylistId &&
//                 daynumber == dayofweek) {
//               // Match found, get start time and end time
//               String startTime = block['startTime'];
//               String endTime = block['endTime'];

//               DateFormat dateFormat = DateFormat("h:mma");
//               DateTime startDateTime = dateFormat.parse(startTime);
//               DateTime endDateTime = dateFormat.parse(endTime);

//               // Convert updated time to 24-hour format
//               DateTime updatedstartDateTime =
//                   dateFormat.parse(availableTimes[timeIndex]);
//               DateTime updatedDateTime = updatedstartDateTime
//                   .add(Duration(milliseconds: currentduration!));

//               print("startdatetime $startDateTime");
//               print("enddatetime $endDateTime");
//               print("updatedstartdatetime $updatedstartDateTime");
//               print("updated end date tiem $updatedDateTime");

//               int startDateTimeMillis = startDateTime.millisecondsSinceEpoch;
//               int endDateTimeMillis = endDateTime.millisecondsSinceEpoch;
//               int updatedStartDateTimeMillis =
//                   updatedstartDateTime.millisecondsSinceEpoch;
//               int updatedEndDateTimeMillis =
//                   updatedDateTime.millisecondsSinceEpoch;

//               print('startdatetime $startDateTimeMillis');
//               print('enddatetime $endDateTimeMillis');
//               print('updatedstartdatetime $updatedStartDateTimeMillis');
//               print('updated end date time $updatedEndDateTimeMillis');

//               // Use start time and end time as needed
//               print(
//                   "this is gyuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhj");

//               if (updatedStartDateTimeMillis >= startDateTimeMillis &&
//                   updatedStartDateTimeMillis <= endDateTimeMillis &&
//                   updatedEndDateTimeMillis >= startDateTimeMillis &&
//                   updatedEndDateTimeMillis <= endDateTimeMillis) {
//                 trythistime = true;
//                 break;
//               } else {
//                 continue;
//               }
//             }
//           }

//           if (appointmentwithspecifictimeandstlistids.isEmpty && trythistime) {
//             isalltimefill = false;
//             break;
//           }
//         }

//         if (isalltimefill) {
//           availableTimes.removeAt(timeIndex);
//           timeIndex = timeIndex - 1;
//           continue;
//         }
//         print(
//             "ijocxvjiooioijooooooooooooooooooooooooooooooooooooooooodvjkkkkkk");
//       }
//       finalAvailableTimes = availableTimes;
//       print("finalavailabletimes=$finalAvailableTimes");
//       return finalAvailableTimes;
//     } catch (e) {
//       // Handle exceptions
//       print(e.toString());
//       return []; // Return an empty list if an error occurs
//     } finally {
//       setState(() {
//         _isloadingtime = false;
//         _isTimeFiltered = true; // Set to true after filtering is done
//       });
//     }
//   }

//   bool isSameTime(DateTime a, DateTime b) {
//     return a.hour == b.hour && a.minute == b.minute;
//   }

//   bool isSameTimeOut(DateTime a, DateTime b) {
//     return a.year == b.year &&
//         a.month == b.month &&
//         a.day == b.day &&
//         a.hour == b.hour &&
//         a.minute == b.minute;
//   }

//   Future<List<String>> fetchAvailableTimesList(DateTime selectedDate) async {
//     try {
//       // Format the selected date without the time part
//       String formattedDate =
//           "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final String? selectedAppointmentId =
//           prefs.getString('selected_appointment_id');
//       print("juhfdhuifhuhfhfjnf$selectedAppointmentId");
//       List<AvailableTimeSlot> fetchedTimeSlots =
//           await ApiService.fetchAvailableTimeSlots(
//         selectedAppointmentId!,
//         formattedDate,
//       );

//       List<String> times = [];

//       fetchedTimeSlots.forEach((timeSlot) {
//         times.add(timeSlot.startDateTimeForView ?? "");
//       });
//       print("ydfuidfhhbhhdnewbhhbdhcjbhj$times");
//       return times;
//     } catch (e) {
//       print("Error fetching available times: $e");
//       return [];
//     }
//   }

//   int _selectIndex = -1;
//   bool _showTime = false;

//   Map<DateTime, List> events = {
//     DateTime.now().subtract(const Duration(days: 2)): ['Not Available'],
//     DateTime.now().subtract(const Duration(days: 1)): ['Not Available'],
//     DateTime.now(): ['Available'],
//     DateTime.now().add(const Duration(days: 1)): ['Available'],
//     DateTime.now().add(const Duration(days: 2)): ['Available'],
//     DateTime.now().add(const Duration(days: 3)): ['Available'],
//     // Additional Available Date
//   };

//   bool _isBlackoutDate(DateTime day) {
//     for (var blackoutDate in _blackoutDates) {
//       // Convert start and end timestamps to DateTime objects
//       DateTime startDate =
//           DateTime.fromMillisecondsSinceEpoch(blackoutDate.date);
//       DateTime endDate = DateTime.fromMillisecondsSinceEpoch(blackoutDate.date);

//       if (isSameDay(day, startDate) || isSameDay(day, endDate)) {
//         return true;
//       }
//     }
//     return false;
//   }

//   DateTime? _selectedDate;
//   bool _isDateAvailable = false;

// // Future<void> _saveAndNavigate() async {
// //   try {
// //     setState(() {
// //       _isloadingbutton = true; // Show circular progress indicator
// //     });

// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     int? fittingroomid = prefs.getInt('selectedStylistId');
// //     prefs.setString('selectedtimehere', finalAvailableTimes[_selectIndex]);
// //     String selectedDateString = DateFormat('yyyy-MM-dd').format(_selectedDate!);

// //     prefs.setString('selecteddatehere', selectedDateString);

// //     print(finalAvailableTimes[_selectIndex]);

// //     // Await the completion of newtypeofstylishids
// //     await newtypeofstylishids(
// //         _selectedDate!, finalAvailableTimes[_selectIndex]);
// //     print(_selectedDate);
// //     print(_selectIndex);
// //     DateTime selectedDate = DateTime.parse(selectedDateString);
// //     final response = await ApiService.fetchAppointmentsList();
// //     final List<dynamic> allAppointments = response['result'];
// //     DateTime selectedDateTime =
// //         _newtypeformatDateTime(selectedDate, finalAvailableTimes[_selectIndex]);
// //     List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
// //         .map((json) => AppointmentList.fromJson(json))
// //         .where((appointment) => isSameDay(selectedDateTime,
// //             DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
// //         .toList();
// //     final int? currentduration = prefs.getInt('appointment_type_duration');

// //     DateTime selectedstartdatetime =
// //         selectedDateTime.subtract(const Duration(hours: 5, minutes: 30));
// //     final int newselectedstartdatetime =
// //         selectedstartdatetime.millisecondsSinceEpoch;
// //     int updatedenddatetime = newselectedstartdatetime + currentduration!;
// //     List<AppointmentList> appointmentsforstartandenddatetime =
// //         appointmentsForSelectedDateTime
// //             .where((appointment) =>
// //                 appointment.startDateTime == newselectedstartdatetime &&
// //                 appointment.endDateTime == updatedenddatetime &&
// //                 appointment.fittingRoomId == fittingroomid)
// //             .toList();

// //     if (_selectedDate != null &&
// //         _selectIndex != -1 &&
// //         _isStylistIdsFiltered &&
// //         appointmentsforstartandenddatetime.isEmpty
// //     ) {
// //       DateTime formattedDateTime =
// //           _newformatDateTime(_selectedDate!, finalAvailableTimes[_selectIndex]);

// //       // Save to local storage
// //       String newformatteddatetime = formattedDateTime.toString();
// //       await prefs.setString('selectedDateTime', newformatteddatetime);
// //       print(formattedDateTime);

// //       print(DateTime.parse(newformatteddatetime)
// //           .millisecondsSinceEpoch
// //           .toString());

// //       // Navigate to next page
// //       if (mounted) {
// //         Navigator.push(context,
// //             MaterialPageRoute(builder: (context) => const TermConditionScreen()));
// //       }
// //     } else {
// //       throw Exception('Please select another date to book appointment.');
// //     }
// //   } catch (e) {
// //     if (mounted) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text(e.toString())),
// //       );
// //     }
// //   } finally {
// //     // Reset selected date and time to null
// //     _selectedDate = null;
// //     _selectIndex = -1;
// //     setState(() {
// //       _isloadingbutton = false; // Hide circular progress indicator
// //     });
// //   }
// // }

//   Future<void> _saveAndNavigate() async {
//     setState(() {
//       _isloadingbutton = true; // Show circular progress indicator
//     });

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? fittingroomid = prefs.getInt('selectedStylistId');
//     prefs.setString('selectedtimehere', finalAvailableTimes[_selectIndex]);
//     String selectedDateString = DateFormat('yyyy-MM-dd').format(_selectedDate!);

//     prefs.setString('selecteddatehere', selectedDateString);

//     print(finalAvailableTimes[_selectIndex]);

//     // Await the completion of newtypeofstylishids
//     await newtypeofstylishids(
//         _selectedDate!, finalAvailableTimes[_selectIndex]);
//     print(_selectedDate);
//     print(_selectIndex);
//     DateTime selectedDate = DateTime.parse(selectedDateString);
//     final response = await ApiService.fetchAppointmentsList();
//     final List<dynamic> allAppointments = response['result'];
//     DateTime selectedDateTime =
//         _newtypeformatDateTime(selectedDate, finalAvailableTimes[_selectIndex]);
//     List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
//         .map((json) => AppointmentList.fromJson(json))
//         .where((appointment) => isSameDay(selectedDateTime,
//             DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
//         .toList();
//     final int? currentduration = prefs.getInt('appointment_type_duration');

//     DateTime selectedstartdatetime =
//         selectedDateTime.subtract(const Duration(hours: 5, minutes: 30));
//     final int newselectedstartdatetime =
//         selectedstartdatetime.millisecondsSinceEpoch;
//     int updatedenddatetime = newselectedstartdatetime + currentduration!;
//     List<AppointmentList> appointmentsforstartandenddatetime =
//         appointmentsForSelectedDateTime
//             .where((appointment) =>
//                 appointment.startDateTime == newselectedstartdatetime &&
//                 appointment.endDateTime == updatedenddatetime &&
//                 appointment.fittingRoomId == fittingroomid)
//             .toList();
//     print(appointmentsforstartandenddatetime.length);

//     if (_selectedDate != null &&
//         _selectIndex != -1 &&
//         _isStylistIdsFiltered &&
//         appointmentsforstartandenddatetime.isEmpty &&
//         fittingroomid != null) {
//       DateTime formattedDateTime =
//           _newformatDateTime(_selectedDate!, finalAvailableTimes[_selectIndex]);

//       // Save to local storage
//       String newformatteddatetime = formattedDateTime.toString();
//       await prefs.setString('selectedDateTime', newformatteddatetime);
//       print(formattedDateTime);

//       print(DateTime.parse(newformatteddatetime)
//           .millisecondsSinceEpoch
//           .toString());

//       if (mounted) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const TermConditionScreen()));
//       }
//     }

//     setState(() {
//       _isloadingbutton = false;
//     });
//   }

//   DateTime _newtypeformatDateTime(DateTime date, String times) {
//     DateTime selectedTime = _getTimeFromString(times);
//     DateTime combinedDateTime = DateTime.utc(
//       date.year,
//       date.month,
//       date.day,
//       selectedTime.hour,
//       selectedTime.minute,
//       selectedTime.second,
//       selectedTime.millisecond,
//       selectedTime.microsecond,
//     );
//     DateTime kolkataDate = combinedDateTime;

//     // Format the combined DateTime object to the desired format

//     return kolkataDate;
//   }

//   DateTime _newformatDateTime(DateTime date, String times) {
//     DateTime selectedTime = _getTimeFromString(times);
//     DateTime combinedDateTime = DateTime.utc(
//       date.year,
//       date.month,
//       date.day,
//       selectedTime.hour,
//       selectedTime.minute,
//       selectedTime.second,
//       selectedTime.millisecond,
//       selectedTime.microsecond,
//     );
//     DateTime kolkataDate =
//         combinedDateTime.subtract(const Duration(hours: 5, minutes: 30));

//     // Format the combined DateTime object to the desired format

//     return kolkataDate;
//   }

//   DateTime _getTimeFromString(String timeStr) {
//     List<String> timeComponents = timeStr.split(":");
//     int hour = int.parse(timeComponents[0]);
//     int minute = int.parse(timeComponents[1].substring(0, 2));
//     if (timeStr.contains('PM') && hour != 12) hour += 12;
//     return DateTime(0, 0, 0, hour, minute);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'New Customer Info',
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText.headline(text: "Choose Appointment Date & Time"),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               if (_isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else
//                 _buildCalendar(),
//               (_showTime)
//                   ? _isloadingtime
//                       ? const Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : Column(
//                           children: [
//                             const SizedBox(height: 20.0),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText.headline(
//                                     text:
//                                         "Select date to see available time slots"),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const Divider(
//                               thickness: 0.3,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Column(
//                               children: [
//                                 GridView.builder(
//                                   shrinkWrap: true,
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 3,
//                                     mainAxisExtent: 35,
//                                     mainAxisSpacing: 15,
//                                     crossAxisSpacing: 15,
//                                   ),
//                                   itemCount: _isTimeFiltered
//                                       ? finalAvailableTimes.length
//                                       : 0,
//                                   itemBuilder: (context, index) {
//                                     return InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           _selectIndex = index;
//                                         });
//                                       },
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         height: 35,
//                                         width: 85,
//                                         decoration: BoxDecoration(
//                                           color: _selectIndex == index
//                                               ? CustomColors.primaryOrange
//                                               : null,
//                                           border: Border.all(
//                                             color: _selectIndex == index
//                                                 ? CustomColors.primaryOrange
//                                                 : CustomColors.inactiveColor,
//                                           ),
//                                         ),
//                                         child: CustomText.bodyText(
//                                           text: finalAvailableTimes[index]
//                                               .toString(),
//                                           color: _selectIndex == index
//                                               ? CustomColors.white
//                                               : CustomColors.primaryBlack,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 if (showspecifictimeerror ||
//                                     finalAvailableTimes.isEmpty)
//                                   CustomText.headingText(
//                                       text:
//                                           "Please select another date to book an appointment",
//                                       color: CustomColors.errorColor),
//                                 // if (finalAvailableTimes.isEmpty)
//                                 //   CustomText.headingText(
//                                 //       text:
//                                 //           "Please select another time stylist is not available at this specific time",
//                                 //       color: CustomColors.errorColor),
//                               ],
//                             ),
//                           ],
//                         )
//                   : CustomText.bodyText(
//                       text: 'Select date to see available time slots',
//                     ),
//               SizedBox(
//                 height: 20,
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     color: Colors.transparent,
//                     height: size.height * 0.062,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: _isloadingbutton
//                             ? CircularProgressIndicator() // Show circular progress indicator while loading
//                             : (_selectIndex != -1
//                                 ? CustomButton(
//                                     onTap: _saveAndNavigate,
//                                     text: 'Next',
//                                   )
//                                 : InactiveButton(text: 'Next')),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCalendar() {
//     return TableCalendar(
//       firstDay: DateTime.now().subtract(const Duration(days: 365)),
//       focusedDay: _focusedDay,
//       lastDay: _lastAllowedDay,
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDate, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         if (_isFutureDate(selectedDay) && !_isBlackoutDate(selectedDay)) {
//           setState(() {
//             _selectedDate = selectedDay;
//             _focusedDay = focusedDay; // Update the focused day
//             _showTime = true;
//             _isTimeFiltered = false;
            
//           });
//           print("hudhuhudihh-$selectedDay");
//           fetchfinallistoftime(selectedDay);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('This date is not available for selection.')),
//           );
//         }
//       },
//       onPageChanged: (focusedDay) {
//         setState(() {
//           _isLoading = true; // Show circular indicator
//         });

//         if (focusedDay.isAfter(_lastAllowedDay)) {
//           setState(() {
//             _focusedDay = _lastAllowedDay;
//           });
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text(
//                     'Appointments can be booked only for the next three months.')),
//           );
//         } else {
//           setState(() {
//             _focusedDay = focusedDay; // Update the focused day
//           });
//         }

//         // Calculate the start and end dates of the currently focused month
//         DateTime startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
//         DateTime endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

//         _fetchBlackoutDates(startDate, endDate);
//       },
//       calendarStyle: CalendarStyle(
//         outsideDaysVisible: false,
//         isTodayHighlighted: true,
//         outsideTextStyle: TextStyle(color: Colors.grey[400]),
//         defaultTextStyle: const TextStyle(color: Colors.blue),
//         weekNumberTextStyle: const TextStyle(color: Colors.red),
//         weekendTextStyle: const TextStyle(color: Colors.pink),
//         todayDecoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.transparent, // Set to transparent
//         ),
//         selectedDecoration: const BoxDecoration(
//           // Red circle for selected date
//           color: AppColors.selectedColorDark,
//           shape: BoxShape.circle,
//         ),
//         todayTextStyle: const TextStyle(color: Colors.blue),
//       ),
//       // : EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       calendarBuilders: CalendarBuilders(
//         selectedBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(4.0),
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//             color:
//                 AppColors.selectedColorDark, // Red color for the selected date
//             shape: BoxShape.circle, // Circular shape
//           ),
//           child: Text(
//             '${date.day}',
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//         defaultBuilder: (context, date, events) {
//           bool isSelectable = !_isPastDate(date) && !_isBlackoutDate(date);
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: isSelectable
//                   ? AppColors.availableColor
//                   : AppColors.secondaryColor,
//               shape: BoxShape.circle,
//             ),
//             child: Text('${date.day}',
//                 style: TextStyle(
//                     color: isSelectable
//                         ? Colors.black
//                         : AppColors.primaryTextColor)),
//           );
//         },
//       ),
//     );
//   }
// }
