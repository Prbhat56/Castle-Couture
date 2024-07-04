import '../../../../core/app_export.dart';

class AppointmentPageButton {
  static addCalendarButton(BuildContext context, void Function()? onTap) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      onPressed: onTap,
      icon: const Icon(Icons.history, color: Colors.black),
      label: CustomText.subHeadingText(text: 'View Appointment'),
    );
  }

  static shopButton(BuildContext context, void Function()? onTap) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      onPressed: onTap,
      icon: const Icon(
        Icons.grid_view_outlined,
        color: Colors.black,
      ),
      label: CustomText.subHeadingText(text: 'Book New Appointment'),
    );
  }
}
