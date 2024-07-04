import 'package:castle_couture/core/app_export.dart';

class NavigateUtils {
  static void pushNamed(context, String name) {
    Navigator.pushNamed(context, name);
  }

  static void pushNamedReplacement(context, String name) {
    Navigator.pushReplacementNamed(context, name);
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}