import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/login_screen.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/otp_screen/otp_screen.dart';
import 'package:castle_couture/presentation/b_home_page/home_page.dart';
import 'package:castle_couture/presentation/c_appointment_screen/new_appointment_screens/new_select_appointment_type.dart';
import 'package:castle_couture/presentation/no_screen/no_screen.dart';
import 'package:castle_couture/routes/routes.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginscreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.otpscreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );

      //           case Routes.signupscreen:
      // return MaterialPageRoute(
      //   builder: (_) => const SignupScreen(),
      // );
      case Routes.homepage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.appointmentscreen:
        return MaterialPageRoute(
          builder: (_) => const NewAppointmentScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NoScreenPage(),
        );
    }
  }
}
