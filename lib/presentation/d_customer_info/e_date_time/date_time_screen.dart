import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/appointment_list_data_model.dart';
import 'package:castle_couture/api_integration/data_model/available_time_slot_data_model.dart';
import 'package:castle_couture/api_integration/data_model/date_available_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/d_customer_info/e_date_time/logic/function_list.dart';

import 'package:castle_couture/presentation/d_customer_info/f_term_condition/term_condition_screen.dart';
import 'package:castle_couture/widgets/custom_color/custom_colors.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime _lastAllowedDay = DateTime.now().add(const Duration(days: 120));
  DateTime _focusedDay = DateTime.now();
  Map<CalendarFormat, String> availableCalendarFormats = {
    CalendarFormat.month: 'Month',
    //CalendarFormat.week: 'Week',
  };
  List<DateAvailable> _blackoutDates = [];
  bool _isLoading = true;
  int appointment_type_id = 0;
  final bool _isloadingtime = false;
  final List<String> times = [];
  List<AvailableTimeSlot> timeslotlist = [];

  bool _isloadingbutton = false;

  bool foundAvailableSlot = false;
  bool showtimeerror = false;
  bool showspecifictimeerror = false;
  List<String> finalAvailableTimes = [];
  bool showblockerror = false;
  bool _isTimeFiltered = false;
  bool _isStylistIdsFiltered = false;
  bool _showstylistiderror = false;
  bool _buttonactive = true;

  int _selectIndex = -1;

  bool _showTime = false;

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Customer Info',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.headline(text: "Choose Appointment Date & Time"),
              const SizedBox(
                height: 10.0,
              ),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                _buildCalendar(),
              (_showTime)
                  ? _isloadingtime
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.headline(
                                    text:
                                        "Select date to see available time slots"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(thickness: 0.3),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                _isTimeFiltered
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisExtent: 35,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 15,
                                        ),
                                        itemCount: timeslotlist.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectIndex = index;
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                color: _selectIndex == index
                                                    ? CustomColors.primaryOrange
                                                    : null,
                                                border: Border.all(
                                                  color: _selectIndex == index
                                                      ? CustomColors
                                                          .primaryOrange
                                                      : CustomColors
                                                          .inactiveColor,
                                                ),
                                              ),
                                              child: CustomText.bodyText(
                                                text: timeslotlist[index]
                                                        .startDateTimeForView ??
                                                    "",
                                                color: _selectIndex == index
                                                    ? CustomColors.white
                                                    : CustomColors.primaryBlack,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                if (
                                    timeslotlist.isEmpty)
                                  CustomText.headingText(
                                      text:
                                          "Please select another date to book an appointment",
                                      color: CustomColors.errorColor),
                                // if (_showstylistiderror)
                                //   CustomText.headingText(
                                //       text:
                                //           "Please select another time stylist is not available at this specific time",
                                //       color: CustomColors.errorColor),
                              ],
                            ),
                          ],
                        )
                  : CustomText.bodyText(
                      text: 'Select date to see available time slots',
                    ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: size.height * 0.062,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _isloadingbutton
                            ? const CircularProgressIndicator() // Show circular progress indicator while loading
                            : ((_selectIndex != -1 && _buttonactive)
                                ? CustomButton(
                                    onTap: _saveAndNavigate,
                                    text: 'Next',
                                  )
                                : const InactiveButton(text: 'Next')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDate = _focusedDay;
    DateTime startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
    DateTime endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    _fetchBlackoutDates(startDate, endDate);
    _lastAllowedDay = DateTime(_focusedDay.year, _focusedDay.month + 3, 0);

    _isStylistIdsFiltered = false;
    _showstylistiderror = false;
    _buttonactive = true;
  }

  Future<List<AvailableTimeSlot>> fetchAvailableTimesList(
      DateTime selectedDate) async {
    try {
      String formattedDate =
          "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? selectedAppointmentId =
          prefs.getString('selected_appointment_id');

      List<AvailableTimeSlot> fetchedTimeSlots =
          await ApiService.fetchAvailableTimeSlots(
        selectedAppointmentId!,
        formattedDate,
      );
      print(fetchedTimeSlots);

      // Check if the widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          timeslotlist = fetchedTimeSlots;
          _isTimeFiltered = true;
        });
      }

      return timeslotlist;
    } catch (e) {
      print("Error fetching available times: $e");
      return [];
    }
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.now().subtract(const Duration(days: 365)),
      focusedDay: _focusedDay,
      lastDay: _lastAllowedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!_isBlackoutDate(selectedDay)) {
          print("hudhuhudihh-$selectedDay");
          fetchAvailableTimesList(selectedDay);
          setState(() {
            _selectedDate = selectedDay;
            _focusedDay = focusedDay; // Update the focused day
            _showTime = true;
            _isTimeFiltered = false;
            _showstylistiderror = false;
            _buttonactive = true;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('This date is not available for selection.')),
          );
        }
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _isLoading = true; // Show circular indicator
        });

        if (focusedDay.isAfter(_lastAllowedDay)) {
          setState(() {
            _focusedDay = _lastAllowedDay;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'Appointments can be booked only for the next three months.')),
          );
        } else {
          setState(() {
            _focusedDay = focusedDay; // Update the focused day
          });
        }

        // Calculate the start and end dates of the currently focused month
        DateTime startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
        DateTime endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

        _fetchBlackoutDates(startDate, endDate);
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        isTodayHighlighted: true,
        outsideTextStyle: TextStyle(color: Colors.grey[400]),
        defaultTextStyle: const TextStyle(color: Colors.blue),
        weekNumberTextStyle: const TextStyle(color: Colors.red),
        weekendTextStyle: const TextStyle(color: Colors.pink),
        todayDecoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, // Set to transparent
        ),
        selectedDecoration: const BoxDecoration(
          // Red circle for selected date
          color: AppColors.selectedColorDark,
          shape: BoxShape.circle,
        ),
        todayTextStyle: const TextStyle(color: Colors.blue),
      ),
      // : EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color:
                AppColors.selectedColorDark, // Red color for the selected date
            shape: BoxShape.circle, // Circular shape
          ),
          child: Text(
            '${date.day}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        defaultBuilder: (context, date, events) {
          bool isSelectable = !FunctionListForCalendarPage.isPastDate(date) &&
              !_isBlackoutDate(date);
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelectable
                  ? AppColors.availableColor
                  : AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Text('${date.day}',
                style: TextStyle(
                    color: isSelectable
                        ? Colors.black
                        : AppColors.primaryTextColor)),
          );
        },
      ),
    );
  }

  Future<void> _fetchBlackoutDates(DateTime startdate, DateTime enddate) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      appointment_type_id =
          int.parse(prefs.getString('selected_appointment_id') ?? '');
      print("mc $appointment_type_id");

      // Fetch available dates from the API
      List<DateAvailable> fetchedDates = await ApiService.fetchAvailableDates(
        appointment_type_id,
        startdate,
        enddate,
      );
      print("fetcheddate mc2$fetchedDates");

      List<DateAvailable> blackoutDates =
          fetchedDates.where((date) => !date.availableTimeSlot).toList();
      print("blackoutdatesmc3$blackoutDates");

      setState(() {
        _blackoutDates = blackoutDates;
        _isLoading = false;
      });

      // _blackoutDates.forEach((date) {});
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _isBlackoutDate(DateTime day) {
    for (var blackoutDate in _blackoutDates) {
      // Convert start and end timestamps to DateTime objects
      DateTime startDate =
          DateTime.fromMillisecondsSinceEpoch(blackoutDate.date);
      DateTime endDate = DateTime.fromMillisecondsSinceEpoch(blackoutDate.date);

      if (isSameDay(day, startDate) || isSameDay(day, endDate)) {
        return true;
      }
    }
    return false;
  }

  Future<void> _saveAndNavigate() async {
    try {
      setState(() {
        _isloadingbutton = true;
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Get the selected time slot details
      AvailableTimeSlot selectedTimeSlot = timeslotlist[_selectIndex];
      print("macpro ${selectedTimeSlot.fittingRoomId}");
      print("macpro ${selectedTimeSlot.startDateTime}");
      print("macpro ${selectedTimeSlot.endDateTime}");
        DateTime formattedDateTime =
              FunctionListForCalendarPage.newtypeformatDateTime(
                  _selectedDate!, selectedTimeSlot.startDateTimeForView!);
                  print("gfgffgfgfgfgfgrfg${selectedTimeSlot.startDateTimeForView}");

          String formattedDateTimeString = formattedDateTime.toString();
          await prefs.setString('selectedDateTime', formattedDateTimeString);

      // Save the selected time slot details to SharedPreferences

      prefs.setInt('selected_fitting_room_id', selectedTimeSlot.fittingRoomId!);
      prefs.setInt('selected_start_date_time', selectedTimeSlot.startDateTime!);
      prefs.setInt('selected_end_date_time', selectedTimeSlot.endDateTime!);

      String selectedDateString =
          DateFormat('yyyy-MM-dd').format(_selectedDate!);
      prefs.setString('selecteddatehere', selectedDateString);

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TermConditionScreen(),
          ),
        );
      }
    } catch (e) {
      print("Error in _saveAndNavigate: $e");
    } finally {
      setState(() {
        _isloadingbutton = false;
      });
    }
  }
}
