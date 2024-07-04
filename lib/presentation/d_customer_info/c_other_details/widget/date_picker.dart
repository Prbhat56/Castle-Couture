import 'package:flutter/material.dart';

class DatePickerController {
  static Future<DateTime?> pickEvent(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    return picked;
  }
  static Future<DateTime?> pickDob(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime lastDate = currentDate.subtract(const Duration(days: 18 * 365));
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: lastDate,
    );
    return picked;
  }
}
