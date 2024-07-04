// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/blackout_data_model.dart';
// import 'package:castle_couture/core/app_export.dart';

// import 'package:castle_couture/presentation/d_customer_info/e_date_time/widget/time_list.dart';
// import 'package:castle_couture/presentation/d_customer_info/f_term_condition/term_condition_screen.dart';
// import 'package:castle_couture/widgets/custom_color/custom_colors.dart';
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
//   List<BlackoutDate> _blackoutDates = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _focusedDay = DateTime.now();
//     _selectedDate = _focusedDay; 

//     _fetchBlackoutDates();
//     _lastAllowedDay = DateTime(_focusedDay.year, _focusedDay.month + 3, 0);
//   }

//   bool _isPastDate(DateTime day) {
//     return day.isBefore(DateTime.now());
//   }

//   bool _isFutureDate(DateTime day) {
//     return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
//   }

//   Future<void> _fetchBlackoutDates() async {
//     try {
//       List<BlackoutDate> fetchedDates = await ApiService.fetchBlackoutDates();
//       setState(() {
//         _blackoutDates = fetchedDates;
//         _isLoading = false;
//       });

//       fetchedDates.forEach((date) {
//         print(
//             "Blackout Date: Start - ${date.startDateTime}, End - ${date.endDateTime}");
//       });
//     } catch (e) {
//       print("Error fetching blackout dates: $e");
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   bool _is24HourFormat = false;
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
//           DateTime.fromMillisecondsSinceEpoch(blackoutDate.startDateTime);
//       DateTime endDate =
//           DateTime.fromMillisecondsSinceEpoch(blackoutDate.endDateTime);

//       if (isSameDay(day, startDate) || isSameDay(day, endDate)) {
//         return true;
//       }
//     }
//     return false;
//   }

//   bool _isOutsideOrWeekend(DateTime day) {
//     // Check if the day is outside the current month or a weekend
//     return day.month != _focusedDay.month ||
//         day.weekday == DateTime.saturday ||
//         day.weekday == DateTime.sunday;
//   }

//   DateTime? _selectedDate;
//   bool _isDateAvailable = false;

//   Future<void> _saveAndNavigate() async {
//     print(times[_selectIndex]);
//     if (_selectedDate != null && _selectIndex != -1) {
//       // Combining selected date with a selected time
//       String formattedDateTime = _formatDateTime(_selectedDate!, _selectIndex);

//       // Save to local storage
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('selectedDateTime', formattedDateTime);

//       // Navigate to next page
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const TermConditionScreen()));
//     }
//   }

//   String _formatDateTime(DateTime date, int timeIndex) {
//     // Assuming 'times' is a list of Strings like '8:00 AM'
//     DateTime selectedTime = _getTimeFromString(times[timeIndex]);
//     DateTime combinedDateTime = DateTime(date.year, date.month, date.day,
//         selectedTime.hour, selectedTime.minute);

//     // Formatting to the specified format
//     return combinedDateTime.toIso8601String();
//   }

//   DateTime _getTimeFromString(String timeStr) {
//     int hour = int.parse(timeStr.split(':')[0]);
//     int minute = int.parse(timeStr.split(':')[1].split(' ')[0]);
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
//               _showTime
//                   ? Column(
//                       children: [
//                         const SizedBox(height: 20.0),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomText.headline(
//                                 text:
//                                     "Select date to see available time slots"),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Divider(
//                           thickness: 0.3,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Column(
//                           children: [
//                             GridView.builder(
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3,
//                                 mainAxisExtent: 35,
//                                 mainAxisSpacing: 15,
//                                 crossAxisSpacing: 15,
//                               ),
//                               itemCount: _is24HourFormat
//                                   ? times.length
//                                   : times24.length,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       _selectIndex = index;
//                                     });
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     height: 35,
//                                     width: 85,
//                                     decoration: BoxDecoration(
//                                       color: _selectIndex == index
//                                           ? CustomColors.primaryOrange
//                                           : null,
//                                       border: Border.all(
//                                         color: _selectIndex == index
//                                             ? CustomColors.primaryOrange
//                                             : CustomColors.inactiveColor,
//                                       ),
//                                     ),
//                                     child: CustomText.bodyText(
//                                       text: _is24HourFormat
//                                           ? times[index].toString()
//                                           : times24[index].toString(),
//                                       color: _selectIndex == index
//                                           ? CustomColors.white
//                                           : CustomColors.primaryBlack,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
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
//                     height: size.height *
//                         0.062, // Set the height according to your design
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16.0,
//                           ),
//                           child: _selectIndex != -1
//                               ? CustomButton(
//                                   onTap: _saveAndNavigate,
//                                   text: 'Next',
//                                 )
//                               : const InactiveButton(text: 'Next')),
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
//           });
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('This date is not available for selection.')),
//           );
//         }
//       },
//       onPageChanged: (focusedDay) {
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
