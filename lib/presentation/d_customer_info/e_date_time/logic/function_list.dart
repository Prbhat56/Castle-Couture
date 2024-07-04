// date_time_helper.dart

import 'package:intl/intl.dart';

class FunctionListForCalendarPage {
  static int findTimeDifference(String startTimeString, String endTimeString) {
    DateTime startTime = parseTimeStringHello(startTimeString);
    DateTime endTime = parseTimeStringHello(endTimeString);
    int differenceMilliseconds = endTime.difference(startTime).inMilliseconds;
    return differenceMilliseconds;
  }

  static DateTime formatDateTime(DateTime date, String times) {
    DateTime selectedTime = getTimeFromString(times);
    DateTime combinedDateTime = DateTime.utc(
      date.year,
      date.month,
      date.day,
      selectedTime.hour,
      selectedTime.minute,
      selectedTime.second,
      selectedTime.millisecond,
      selectedTime.microsecond,
    );
    DateTime kolkataDate =
        combinedDateTime.subtract(const Duration(hours: 5, minutes: 30));
    return kolkataDate;
  }

  static int getDayInteger(String dayName) {
    switch (dayName.toLowerCase()) {
      case 'sunday':
        return 1;
      case 'monday':
        return 2;
      case 'tuesday':
        return 3;
      case 'wednesday':
        return 4;
      case 'thursday':
        return 5;
      case 'friday':
        return 6;
      case 'saturday':
        return 7;
      default:
        return -1; // Return -1 for invalid input
    }
  }

  static DateTime getTimeFromString(String timeStr) {
    List<String> timeComponents = timeStr.split(":");
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1].substring(0, 2));
    if (timeStr.contains('PM') && hour != 12) hour += 12;
    return DateTime(0, 0, 0, hour, minute);
  }

  static bool isFutureDate(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
  }

  static bool isPastDate(DateTime day) {
    return day.isBefore(DateTime.now());
  }

  static DateTime newtypeformatDateTime(DateTime date, String times) {
    DateTime selectedTime = getTimeFromString(times);
    DateTime combinedDateTime = DateTime.utc(
      date.year,
      date.month,
      date.day,
      selectedTime.hour,
      selectedTime.minute,
      selectedTime.second,
      selectedTime.millisecond,
      selectedTime.microsecond,
    );
    DateTime kolkataDate = combinedDateTime.subtract(const Duration(hours: 5, minutes: 30));

    return kolkataDate;
  }

  static DateTime parseTimeString(String timeString) {
    return DateTime.parse('1970-01-01 $timeString');
  }

  static DateTime parseTimeStringHello(String timeString) {
    final parsedTime = DateFormat("hh:mma").parse(timeString);
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);
  }
}
