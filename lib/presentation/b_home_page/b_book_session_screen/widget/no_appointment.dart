import 'package:castle_couture/presentation/c_appointment_screen/new_appointment_screens/new_new_appointment_screen.dart';
import 'package:castle_couture/widgets/back_button/custom_back_button.dart';

import '../../../../core/app_export.dart';

class NoAppointment extends StatelessWidget {
  const NoAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.bookAnAppointment,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
            child: CustomText.headline(text: 'NO APPOINTMENTS'),
          ),
          CustomText.captionText(
            color: CustomColors.liteBlack,
            text: 'Book an appointment to Connect with our Experts Designers.',
          ),
          const SizedBox(height: 24),
          NewCustomButton(
            width: size.width * 0.8,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewNewAppointmentScreen(),
                ),
              );
              // NavigateUtils.pop(context);
            },
            text: '+ Book an appointment',
          ),
        ],
      ),
    );
  }
}
