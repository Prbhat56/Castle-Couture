import 'package:castle_couture/presentation/b_home_page/b_book_session_screen/widget/completed_booking.dart';

import '../../core/app_export.dart';

class CompletedBookingScreen extends StatelessWidget {
  const CompletedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Completed bookings',
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
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
          child: Column(
            children: [
              CompletedBooking(height: size.height * 0.90),
            ],
          ),
        ),
      ),
    );
  }
}
