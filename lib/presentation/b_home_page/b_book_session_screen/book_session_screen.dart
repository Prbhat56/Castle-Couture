import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/b_home_page/b_book_session_screen/widget/completed_booking.dart';
import 'package:castle_couture/presentation/b_home_page/b_book_session_screen/widget/completed_booking_shimmer_effect.dart';
import 'package:castle_couture/presentation/f_completed_booking_screen/completed_booking_screen.dart';

class BookSessionScreen extends StatefulWidget {
  const BookSessionScreen({super.key});

  @override
  State<BookSessionScreen> createState() => _BookSessionScreenState();
}

class _BookSessionScreenState extends State<BookSessionScreen> {
  bool isButtonEnabled = false;

  void toggleButton(bool value) {
    setState(() {
      isButtonEnabled = value;
    });
  }

  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showContent = true;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.captionText(
                    text: 'Completed bookings',
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CompletedBookingScreen(),
                          ));
                    },
                    child: CustomText.spanText(
                        text: 'View all',
                        textDecoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: _showContent
                    ? const CompletedBooking()
                    : const CompletedBookingShimmerEffect()),
            // Booking cards here
            /*   isButtonEnabled ?  CompletedBooking(
              height: size.height * 0.40,
            ) : const NoAppointment(),*/
          ],
        ),
      ),
    );
  }
}
