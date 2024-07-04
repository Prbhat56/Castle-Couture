class Validator {
  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Incorrect phone number';
    } else if (value.length != 10) {
      return 'Enter 10 digit phone number';
    }

    return null;
  }
}
