//import 'package:castle_couture/presentation/d_customer_info/e_date_time/logic/function_list.dart';
//import 'package:castle_couture/widgets/custom_color/custom_colors.dart';
//import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';

//class AppointmentCalendar extends StatefulWidget {
//  const AppointmentCalendar({super.key});

//  @override
//  State<AppointmentCalendar> createState() => _AppointmentCalendarState();
//}

//class _AppointmentCalendarState extends State<AppointmentCalendar> {
//  @override
//  Widget build(BuildContext context) {
//    return TableCalendar(
//      firstDay: DateTime.now().subtract(const Duration(days: 365)),
//      focusedDay: _focusedDay,
//      lastDay: _lastAllowedDay,
//      selectedDayPredicate: (day) {
//        return isSameDay(_selectedDate, day);
//      },
//      onDaySelected: (selectedDay, focusedDay) {
//        if (FunctionListForCalendarPage.isFutureDate(selectedDay) &&
//            !_isBlackoutDate(selectedDay)) {
//          setState(() {
//            _selectedDate = selectedDay;
//            _focusedDay = focusedDay; // Update the focused day
//            _showTime = true;
//            _isTimeFiltered = false;
//            _showstylistiderror = false;
//            _buttonactive = true;
//          });

//          print("hudhuhudihh-$selectedDay");
//          fetchfinallistoftime(selectedDay);
//        } else {
//          ScaffoldMessenger.of(context).showSnackBar(
//            const SnackBar(
//                content: Text('This date is not available for selection.')),
//          );
//        }
//      },
//      onPageChanged: (focusedDay) {
//        setState(() {
//          _isLoading = true; // Show circular indicator
//        });

//        if (focusedDay.isAfter(_lastAllowedDay)) {
//          setState(() {
//            _focusedDay = _lastAllowedDay;
//          });
//          ScaffoldMessenger.of(context).showSnackBar(
//            const SnackBar(
//                content: Text(
//                    'Appointments can be booked only for the next three months.')),
//          );
//        } else {
//          setState(() {
//            _focusedDay = focusedDay; // Update the focused day
//          });
//        }

//        // Calculate the start and end dates of the currently focused month
//        DateTime startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
//        DateTime endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

//        _fetchBlackoutDates(startDate, endDate);
//      },
//      calendarStyle: CalendarStyle(
//        outsideDaysVisible: false,
//        isTodayHighlighted: true,
//        outsideTextStyle: TextStyle(color: Colors.grey[400]),
//        defaultTextStyle: const TextStyle(color: Colors.blue),
//        weekNumberTextStyle: const TextStyle(color: Colors.red),
//        weekendTextStyle: const TextStyle(color: Colors.pink),
//        todayDecoration: const BoxDecoration(
//          shape: BoxShape.circle,
//          color: Colors.transparent, // Set to transparent
//        ),
//        selectedDecoration: const BoxDecoration(
//          // Red circle for selected date
//          color: AppColors.selectedColorDark,
//          shape: BoxShape.circle,
//        ),
//        todayTextStyle: const TextStyle(color: Colors.blue),
//      ),
//      // : EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      calendarBuilders: CalendarBuilders(
//        selectedBuilder: (context, date, events) => Container(
//          margin: const EdgeInsets.all(4.0),
//          alignment: Alignment.center,
//          decoration: const BoxDecoration(
//            color:
//                AppColors.selectedColorDark, // Red color for the selected date
//            shape: BoxShape.circle, // Circular shape
//          ),
//          child: Text(
//            '${date.day}',
//            style: const TextStyle(color: Colors.white),
//          ),
//        ),
//        defaultBuilder: (context, date, events) {
//          bool isSelectable = FunctionListForCalendarPage.isPastDate(date) &&
//              !_isBlackoutDate(date);
//          return Container(
//            margin: const EdgeInsets.all(4.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              color: isSelectable
//                  ? AppColors.availableColor
//                  : AppColors.secondaryColor,
//              shape: BoxShape.circle,
//            ),
//            child: Text('${date.day}',
//                style: TextStyle(
//                    color: isSelectable
//                        ? Colors.black
//                        : AppColors.primaryTextColor)),
//          );
//        },
//      ),
//    );
//  }
//}
