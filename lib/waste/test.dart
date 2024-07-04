//import 'package:flutter_bcrypt/flutter_bcrypt.dart';

//Future<String> hashPassword(String password) async {
//  final salt = await FlutterBcrypt.saltWithRounds(rounds: 10);
//  final hashedPassword = await FlutterBcrypt.hashPw(password: password, salt: salt);
//  return hashedPassword;
//}



//  Future<void> _fetchAppointmentsForSelectedDate(DateTime selectedDate) async {
//    try {
//      setState(() {
//        _isloadingtime = true;
//      });

//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//      final String? selectedAppointmentId =
//          prefs.getString('selected_appointment_id');

//      // Fetch available times for the selected date
//      List<String> availableTimes = await fetchAvailableTimesList(selectedDate);

//      // Filter appointments for each available time
//      for (int timeIndex = 0; timeIndex < availableTimes.length; timeIndex++) {
//        String time = availableTimes[timeIndex];
//        // Combine selected date and time to create DateTime object
//        DateTime selectedDateTime = DateTime(
//          selectedDate.year,
//          selectedDate.month,
//          selectedDate.day,
//          int.parse(time.split(":")[0]), // Extract hour
//          int.parse(time.split(":")[1]), // Extract minute
//        );

//        // Call ApiService to fetch appointments for the combined DateTime
//        final response = await ApiService.fetchAppointmentsList();

//        // Parse the "result" field from the response map
//        final List<dynamic> allAppointments = response['result'];

//        // Filter appointments for the selected DateTime
//        List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
//            .map((json) => AppointmentList.fromJson(json))
//            .where((appointment) => isSameMinute(
//                selectedDateTime,
//                DateTime.fromMillisecondsSinceEpoch(appointment
//                    .startDateTime))) // Check if fitting room is available
//            .toList();

//        if (appointmentsForSelectedDateTime.isEmpty) {
//          final SharedPreferences prefs = await SharedPreferences.getInstance();
//          int selectedStylistId =
//              _stylistIds.isNotEmpty ? _stylistIds.first : 0;

//          // Check if the time index is not the first one
//          if (timeIndex != 0) {
//            // Get the previous time by going back one index
//            DateTime previousDateTime = DateTime(
//              selectedDate.year,
//              selectedDate.month,
//              selectedDate.day,
//              int.parse(times[timeIndex - 1].split(":")[0]), // Extract hour
//              int.parse(times[timeIndex - 1].split(":")[1]), // Extract minute
//            );

//            // Fetch appointments for the previous time slot for the same stylist ID
//            List<AppointmentList> appointmentsAtPreviousTime = allAppointments
//                .map((json) => AppointmentList.fromJson(json))
//                .where((appointment) =>
//                    isSameMinute(
//                        previousDateTime, // Previous time
//                        DateTime.fromMillisecondsSinceEpoch(
//                            appointment.startDateTime)) &&
//                    appointment.fittingRoomId == selectedStylistId)
//                .toList();

//            if (appointmentsAtPreviousTime.isEmpty) {
//              // If there are no appointments at the previous time, assign the stylist ID
//              prefs.setInt('selectedStylistId', selectedStylistId);
//              _fetchTimeSlots(selectedDate);
//              setState(() {
//                _isloadingtime = false;
//              });
//              return;
//            } else {
//              // If there's an appointment at the previous time, check its duration
//              double durationInMilliseconds =
//                  appointmentsAtPreviousTime[0].duration.toDouble();
//              double durationInSeconds = durationInMilliseconds / 1000;
//              double durationInMinutes = durationInSeconds / 60;
//              int hours = durationInMinutes ~/ 60;
//              int minutes = (durationInMinutes % 60).toInt();

//              // Check if the difference in time allows for a new appointment
//              DateTime previousAppointmentEnd = previousDateTime
//                  .add(Duration(hours: hours, minutes: minutes));
//              if (selectedDateTime
//                      .difference(previousAppointmentEnd)
//                      .inMinutes >=
//                  30) {
//                // If the difference in time is sufficient, assign the stylist ID
//                prefs.setInt('selectedStylistId', selectedStylistId);
//                _fetchTimeSlots(selectedDate);
//                setState(() {
//                  _isloadingtime = false;
//                });
//                return;
//              }
//            }
//          } else {
         
//            prefs.setInt('selectedStylistId', selectedStylistId);
//            _fetchTimeSlots(selectedDate);
//            setState(() {
//              _isloadingtime = false;
//            });
//            return;
//          }
//        } else {
//          bool appointmentFound = false;
//          for (int stylistId in _stylistIds) {
//            List<AppointmentList> appointmentsForStylist =
//                appointmentsForSelectedDateTime
//                    .where(
//                        (appointment) => appointment.fittingRoomId == stylistId)
//                    .toList();
//            if (appointmentsForStylist.isEmpty) {
//              final SharedPreferences prefs =
//                  await SharedPreferences.getInstance();
//              prefs.setInt('selectedStylistId', stylistId);
//              print(stylistId);

//              _fetchTimeSlots(selectedDate);

//              appointmentFound = true;
//              break;
//            }
//          }

//          // bool durationExceedsOneHour = appointmentsForSelectedDateTime.any(
//          //     (appointment) =>
//          //         appointment.endDateTime - appointment.startDateTime >
//          //         Duration(hours: 1));

//          // if (durationExceedsOneHour) {
//          //   // Move to the next available time
//          //   continue;
//          // }
//        }
//      }

//      // If no available appointments found for any time, show error
//      ScaffoldMessenger.of(context).showSnackBar(
//        SnackBar(
//          content: Text(
//              'No available appointments for selected date. Please select another date.'),
//        ),
//      );
//      showtimeerror = true;

//      setState(() {
//        _isloadingtime = false;
//      });
//    } catch (e) {
//      print("Error fetching appointments for selected date: $e");
//      setState(() {
//        _isloadingtime = false;
//      });
//    }
//  }

//  bool isSameMinute(DateTime a, DateTime b) {
//    return a.year == b.year &&
//        a.month == b.month &&
//        a.day == b.day &&
//        a.hour == b.hour &&
//        a.minute == b.minute;
//  }





