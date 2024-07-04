import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/b_home_page/a_dashboard_screen/widget/upcoming_booking.dart';

class UpcomingBookingScreen extends StatelessWidget {
  const UpcomingBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upcoming bookings',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
          child: Column(
            children: [
              UpcomingBooking(),
            ],
          ),
        ),
      ),
    );
  }
}
