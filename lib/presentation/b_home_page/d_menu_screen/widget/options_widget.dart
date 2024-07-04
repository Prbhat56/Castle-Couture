import '../../../../core/app_export.dart';

final List<Map<String, dynamic>> items = [
  {
    'leading': const Icon(
      Icons.edit_square,
      color: CustomColors.primaryOrange,
    ),
    'title': const Text('My Profile'),
    'trailing': const Icon(
      Icons.arrow_forward_ios,
      color: CustomColors.inactiveColor,
      size: 18,
    ),
  },
  {
    'leading': const Icon(
      Icons.description_outlined,
      color: CustomColors.primaryOrange,
    ),
    'title': const Text('Terms & Condition'),
    'trailing': const Icon(
      Icons.arrow_forward_ios,
      color: CustomColors.inactiveColor,
      size: 18,
    ),
  },
  {
    'leading': const Icon(
      Icons.privacy_tip_outlined,
      color: CustomColors.primaryOrange,
    ),
    'title': const Text('Privacy Policy'),
    'trailing': const Icon(
      Icons.arrow_forward_ios,
      color: CustomColors.inactiveColor,
      size: 18,
    ),
  },
  {
    'leading': const Icon(
      Icons.login_outlined,
      color: CustomColors.errorColor,
    ),
    'title': const Text(
      'Exit',
      style: TextStyle(color: CustomColors.errorColor),
    ),
  },
];
