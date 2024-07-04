import 'package:castle_couture/core/utils/share_preference/share_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      SharedPreferencesKeys.firstNameKey:
          prefs.getString(SharedPreferencesKeys.firstNameKey) ?? '',
      SharedPreferencesKeys.lastNameKey:
          prefs.getString(SharedPreferencesKeys.lastNameKey) ?? '',
      SharedPreferencesKeys.cityKey:
          prefs.getString(SharedPreferencesKeys.cityKey) ?? '',
      SharedPreferencesKeys.emailKey:
          prefs.getString(SharedPreferencesKeys.emailKey) ?? '',
      SharedPreferencesKeys.mobileNumberKey:
          prefs.getString(SharedPreferencesKeys.mobileNumberKey) ?? '',
      SharedPreferencesKeys.addressKey:
          prefs.getString(SharedPreferencesKeys.addressKey) ?? '',
    };
  }

  static Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String city,
    required String email,
    required String mobileNumber,
    required String address,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesKeys.firstNameKey, firstName);
    await prefs.setString(SharedPreferencesKeys.lastNameKey, lastName);
    await prefs.setString(SharedPreferencesKeys.cityKey, city);
    await prefs.setString(SharedPreferencesKeys.emailKey, email);
    await prefs.setString(SharedPreferencesKeys.mobileNumberKey, mobileNumber);
    await prefs.setString(SharedPreferencesKeys.addressKey, address);
  }
}
