import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/b_home_page/home_page.dart';
import 'package:castle_couture/presentation/d_customer_info/g_booked_appointment/widget/appointment_page_button.dart';
import 'package:lottie/lottie.dart';

class BookedAppointmentScreen extends StatelessWidget {
  const BookedAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      },
      child: Scaffold(
        appBar: const LogoAppBar(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(ImageConstant.booked,
                            height: 300, width: 300),
                      ),
                      CustomText.subHeadingText(
                        text:
                            'Your appointment at Castle Couture has been created',
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          AppointmentPageButton.shopButton(context, () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          }),
                          AppointmentPageButton.addCalendarButton(context, () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(initialPage: 1),
                                ),
                                (route) => false);
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.bodyText(
                    text:
                        'We look forward to working with you! If you need to cancel or reschedule please call us at (732) 952 - 1210',
                    textAlign: TextAlign.start,
                    fontSize: 11,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText.bodyText(
                    text:
                        "If cancelled within 24 hours cancellation policy or a NO CALL NO SHOW occurs, there will be a \$100 fine fee.",
                    textAlign: TextAlign.start,
                    fontSize: 11,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText.bodyText(
                    text:
                        'Due to new email privacy settings, if you have not received an email from Castle Couture, please make sure to view your spam/junk folder.',
                    textAlign: TextAlign.start,
                    fontSize: 11,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
