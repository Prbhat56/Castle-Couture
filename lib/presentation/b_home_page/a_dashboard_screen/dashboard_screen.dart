import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/b_home_page/a_dashboard_screen/widget/upcoming_booking.dart';
import 'package:castle_couture/presentation/c_appointment_screen/new_appointment_screens/new_flow_appointment_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 55.r),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewAppointmentTypeScreenFlow(),
              ),
            );
          },
          child: Container(
            height: 42,
            constraints: BoxConstraints(maxWidth: size.width * 0.50),
            decoration: BoxDecoration(
              color: Colors
                  .black, // Replace with the color you want for the container
              borderRadius:
                  BorderRadius.circular(100), // Circular border radius
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // Adjust padding as needed
            child: Text(
              '+ Book an appointment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 10),
          child: UpcomingBooking()
          // Column(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          //  children: [

          // SingleChildScrollView property
          /*
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),*/

          //Padding(
          //  padding: EdgeInsets.symmetric(horizontal: 8.0),
          //  child: Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //    children: [
          //      Text(
          //        'Scheduled Appointments',
          //        style: TextStyle(
          //          fontSize: 18.0,
          //          fontWeight: FontWeight.w600,
          //        ),
          //      ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const UpcomingBookingScreen(),
          //         ));
          //   },
          //   child: CustomText.spanText(
          //       text: 'View all',
          //       textDecoration: TextDecoration.underline),
          // ),
          //    ],
          //  ),
          //),
          //SizedBox(height: 15),

          //Expanded(
          //    child:
          //        //  _showContent
          //        //     ?
          //        UpcomingBooking()
          //    // : const UpcomingBookShimmerEffect()),
          //    )
          //  ],
          //),
          ),
    );
  }
}
