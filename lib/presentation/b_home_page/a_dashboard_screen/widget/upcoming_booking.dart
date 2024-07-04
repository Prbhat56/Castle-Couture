import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/new_created_appointment_data_model.dart';
import 'package:castle_couture/presentation/b_home_page/a_dashboard_screen/widget/upcoming_book_shimmer_effect.dart';
import 'package:castle_couture/presentation/b_home_page/b_book_session_screen/widget/no_appointment.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_export.dart';

class UpcomingBooking extends StatefulWidget {
  const UpcomingBooking({super.key});

  @override
  State<UpcomingBooking> createState() => _UpcomingBookingState();
}

class _UpcomingBookingState extends State<UpcomingBooking> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: _loadAppointmentIds(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const UpcomingBookShimmerEffect();
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return const NoAppointment();
        } else {
          return _buildAppointmentsList(snapshot.data!);
        }
      },
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedDate;
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    if (hours > 0 && minutes > 0) {
      return '$hours hour $minutes mins';
    } else if (hours > 0) {
      return '$hours hour';
    } else {
      return '$minutes mins';
    }
  }

  Widget _buildAppointmentItem(MappedAppointment appointment) {
    print("appointment time  ${appointment.startDateTime}");
   DateTime appointmentDateTime =
    DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime);

String formattedAppointmentDateTime =
    DateFormat('dd MMM, hh:mm a').format(appointmentDateTime);
print("Formatted appointment date and time: $formattedAppointmentDateTime");
    //String formattedAppointmentDateTime =
    //    DateFormat('dd MMM, hh:mm a').format(appointmentDateTime);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              decoration: const BoxDecoration(
                color: CustomColors.primaryOrange, // Replace with your color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Appointment Date - $formattedAppointmentDateTime',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.typeDescription,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Duration: ${formatDuration(Duration(milliseconds: int.parse(appointment.duration.toString())))}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DottedBorder(
                    color: CustomColors.primaryOrange,
                    dashPattern: const [4, 3],
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        _buildDetailRow('Name', appointment.contactName),
                        _buildDetailRow('Phone', appointment.bestphonenumber),
                        _buildDetailRow('Email', appointment.email),
                        _buildDetailRow('Event Date',
                            formatDate(appointment.eventdate.toString())),
                        _buildDetailRow('Budget', '\$ ${appointment.budget}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentListView(
      List<MappedAppointment> appointments, Size size) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          MappedAppointment appointment = appointments[index];
          return _buildAppointmentItem(appointment);
        },
      ),
    );
  }

//Widget _buildAppointmentsList(List<int> appointmentIds) {
  //  Size size = MediaQuery.of(context).size;
  //  return SizedBox(
  //    height: size.height * 0.78,
  //    child: ListView.builder(
  //      scrollDirection: Axis.vertical,
  //      shrinkWrap: true,
  //      itemCount: appointmentIds.length,
  //      itemBuilder: (context, index) {
  //        int appointmentId = appointmentIds[index];
  //        return FutureBuilder<MappedAppointment>(
  //          future: ApiService.fetchAppointmentDetailById(appointmentId),
  //          builder: (context, snapshot) {
  //            if (snapshot.connectionState == ConnectionState.waiting) {
  //              return const UpcomingBookShimmerEffect();
  //            } else if (snapshot.hasError || snapshot.data == null) {
  //              return const NoAppointment();
  //            } else if (snapshot.data != null) {
  //              MappedAppointment appointment = snapshot.data!;
  //              return Column(
  //                children: [
  //                  if(appointment.eventdate)
  //                  _buildAppointmentItem(appointment),
  //                ],
  //              );
  //            } else {
  //              return const SizedBox();
  //            }
  //          },
  //        );
  //      },
  //    ),
  //  );
  //}

  Widget _buildAppointmentsList(List<int> appointmentIds) {
    Size size = MediaQuery.of(context).size;
    DateTime today = DateTime.now();
    List<MappedAppointment> previousAppointments = [];
    List<MappedAppointment> scheduledAppointments = [];

    return FutureBuilder<List<MappedAppointment>>(
      future: _fetchAppointments(appointmentIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const UpcomingBookShimmerEffect();
        } else if (snapshot.hasError) {
          return Text('Error fetching appointments ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<MappedAppointment> appointments = snapshot.data!;
          for (MappedAppointment appointment in appointments) {
            DateTime eventDate =
                DateTime.fromMillisecondsSinceEpoch(appointment.startDateTime);
            if (eventDate.isBefore(today)) {
              previousAppointments.add(appointment);
            } else {
              scheduledAppointments.add(appointment);
            }
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (scheduledAppointments.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Scheduled Appointments',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              if (scheduledAppointments.isNotEmpty)
                const SizedBox(height: 10.0),
              if (scheduledAppointments.isNotEmpty)
                _buildAppointmentListView(scheduledAppointments, size),
              if (previousAppointments.isNotEmpty) const SizedBox(height: 15),
              if (previousAppointments.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Previous Appointments',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              if (previousAppointments.isNotEmpty) const SizedBox(height: 10.0),
              if (previousAppointments.isNotEmpty)
                _buildAppointmentListView(previousAppointments, size),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Text(
            value ?? '',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<List<MappedAppointment>> _fetchAppointments(
      List<int> appointmentIds) async {
    List<MappedAppointment> appointments = [];

    for (int appointmentId in appointmentIds) {
      MappedAppointment appointment =
          await ApiService.fetchAppointmentDetailById(appointmentId);
      appointments.add(appointment);
    }

    return appointments;
  }

  Future<List<int>> _loadAppointmentIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? appointmentIds = prefs.getStringList('appointment_ids') ?? [];
    return appointmentIds.map((id) => int.parse(id)).toList();
  }
}
