import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/available_time_slot_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppoitmentService{
  
  //Future<List<String>> fetchfinallistoftime(DateTime selectedDate) async {
  //  try {
  //    setState(() {
  //      _isloadingtime = true;
  //    });

  //    List<String> availableTimes = await fetchAvailableTimesList(selectedDate);
  //    print(availableTimes);
  //    finalAvailableTimes.clear();

  //    final response = await ApiService.fetchAppointmentsList();
  //    final List<dynamic> allAppointments = response['result'];

  //    for (int timeIndex = 0; timeIndex < availableTimes.length; timeIndex++) {
  //      String time = availableTimes[timeIndex];
  //      print("response ... ${response['result']}   $time");

  //      DateTime selectedDateTime =
  //          FunctionListForCalendarPage.newtypeformatDateTime(
  //              selectedDate, time);
  //      print(selectedDateTime);

  //      DateTime newselecteddatetime = selectedDateTime;

  //      List<AppointmentList> appointmentsForSelectedDateTime = allAppointments
  //          .map((json) => AppointmentList.fromJson(json))
  //          .where((appointment) => isSameDay(newselecteddatetime,
  //              DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime)))
  //          .toList();

  //      List<AppointmentList> appointmentForThatSpecificTime =
  //          appointmentsForSelectedDateTime.where((appointment) {
  //        DateTime startDateTime =
  //            DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime);

  //        String startTime = '${startDateTime.hour}:${startDateTime.minute}';

  //        String selectedTime = availableTimes[timeIndex];

  //        DateTime firstselectedtime = DateFormat('h:mma').parse(selectedTime);
  //        DateTime adjustedDateTime =
  //            firstselectedtime.add(const Duration(hours: 2, minutes: 30));
  //        String adjustedTime24HourFormat =
  //            DateFormat('HH:mm').format(adjustedDateTime);
  //        print("..............................$adjustedTime24HourFormat");
  //        bool isSameTimeResult = startTime == adjustedTime24HourFormat;
  //        print("timesd.............$isSameTimeResult");
  //        return isSameTimeResult;
  //      }).toList();

  //      bool isalltimefill = true;
  //      for (int stylistId in _stylistIds) {
  //        List<AppointmentList> appointmentwithspecifictimeandstlistids =
  //            appointmentForThatSpecificTime
  //                .where(
  //                    (appointment) => appointment.fittingRoomId == stylistId)
  //                .toList();

  //        bool trythistime = false;
  //        String dayName = DateFormat('EEEE').format(selectedDate);
  //        final SharedPreferences prefs = await SharedPreferences.getInstance();
  //        final int? currentduration =
  //            prefs.getInt('appointment_type_duration');

  //        String? appointmentTypeDescription =
  //            prefs.getString('appointment_type_description');
  //        final List<dynamic> appointmentBlocksResponse =
  //            await ApiService.fetchAppointmentBlocksList();
  //        for (var block in appointmentBlocksResponse) {
  //          String blockAppointmentTypeDescription =
  //              block['appointmentTypeDescription'];
  //          int fittingRoomId = block['fittingRoomId'];

  //          int dayofweek = block["dayOfWeek"];
  //          int daynumber = FunctionListForCalendarPage.getDayInteger(dayName);

  //          if (blockAppointmentTypeDescription == appointmentTypeDescription &&
  //              fittingRoomId == stylistId &&
  //              daynumber == dayofweek) {
  //            // Match found, get start time and end time
  //            String startTime = block['startTime'];
  //            String endTime = block['endTime'];

  //            DateFormat dateFormat = DateFormat("h:mma");
  //            DateTime startDateTime = dateFormat.parse(startTime);
  //            DateTime endDateTime = dateFormat.parse(endTime);

  //            // Convert updated time to 24-hour format
  //            DateTime updatedstartDateTime =
  //                dateFormat.parse(availableTimes[timeIndex]);
  //            DateTime updatedDateTime = updatedstartDateTime
  //                .add(Duration(milliseconds: currentduration!));

  //            int startDateTimeMillis = startDateTime.millisecondsSinceEpoch;
  //            int endDateTimeMillis = endDateTime.millisecondsSinceEpoch;
  //            int updatedStartDateTimeMillis =
  //                updatedstartDateTime.millisecondsSinceEpoch;
  //            int updatedEndDateTimeMillis =
  //                updatedDateTime.millisecondsSinceEpoch;

  //            if (updatedStartDateTimeMillis >= startDateTimeMillis &&
  //                updatedStartDateTimeMillis <= endDateTimeMillis &&
  //                updatedEndDateTimeMillis >= startDateTimeMillis &&
  //                updatedEndDateTimeMillis <= endDateTimeMillis) {
  //              trythistime = true;
  //              break;
  //            } else {
  //              continue;
  //            }
  //          }
  //        }

  //        if (appointmentwithspecifictimeandstlistids.isEmpty && trythistime) {
  //          isalltimefill = false;
  //          break;
  //        }
  //      }

  //      if (isalltimefill) {
  //        availableTimes.removeAt(timeIndex);
  //        timeIndex = timeIndex - 1;
  //        continue;
  //      }
  //    }
  //    finalAvailableTimes = availableTimes;

  //    return finalAvailableTimes;
  //  } catch (e) {
  //    print(e.toString());
  //    return []; // Return an empty list if an error occurs
  //  } finally {
  //    setState(() {
  //      _isloadingtime = false;
  //      _isTimeFiltered = true;
  //    });
  //  }
  //}

  
  Future<List<String>> fetchAvailableTimesList(DateTime selectedDate) async {
    try {
      String formattedDate =
          "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? selectedAppointmentId =
          prefs.getString('selected_appointment_id');
      List<AvailableTimeSlot> fetchedTimeSlots =
          await ApiService.fetchAvailableTimeSlots(
              selectedAppointmentId!, formattedDate);
      List<String> times = [];

      for (var timeSlot in fetchedTimeSlots) {
        times.add(timeSlot.startDateTimeForView ?? "");
      }
      print("times ......$times");
      return times;
    } catch (e) {
      print("$selectedDate  Error fetching available times: $e");
      return [];
    }
  }
}