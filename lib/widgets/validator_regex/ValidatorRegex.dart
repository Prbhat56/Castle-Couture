import 'package:email_validator/email_validator.dart';

class ValidatorRegex {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Email is required';
    } else if (!EmailValidator.validate(value)) {
      return 'ⓘ Please enter a valid email';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Name is required';
    } else if (value.length < 3) {
      return 'ⓘ Name must be at least 3 characters long';
    } else if (value.contains(' ')) {
      return 'ⓘ Name should not contain spaces';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'ⓘ Please enter a valid name';
    } else {
      return null;
    }
  }

  static String? addressValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Address is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'ⓘ Address should not contain special characters';
    } else {
      return null;
    }
  }

  static String? aptUnitValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Apt/unit is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'ⓘ Apt/unit should contain only numbers';
    } else {
      return null;
    }
  }

  static String? cityValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ City is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'ⓘ City should not contain special characters';
    } else {
      return null;
    }
  }
  static String? zipCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Zip code is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'ⓘ Zip code should contain only numbers';
    } else if (value.length < 5) {
      return 'ⓘ Please enter last 5 digits of you zip code';
    } 
    else {
      return null;
    }
  }


  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Password is required';
    } else if (value.length < 8) {
      return 'ⓘ Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).*$')
        .hasMatch(value)) {
      return 'ⓘ Password must contain at least one uppercase letter, '
          'one lowercase letter, one numeric digit, '
          'and one special character';
    } else {
      return null;
    }
  }

  static String? dropdownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Please make a selection';
    } else {
      return null;
    }
  }

  static String? mobileNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Mobile No Required';
    } else {
      RegExp regex = RegExp(r'^[0-9]{10}$');
      if (!regex.hasMatch(value)) {
        return 'ⓘ Inavlid Number';
      } else {
        return null;
      }
    }
  }
  static String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Date is required';
    } else {
      RegExp regex = RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$');
      if (!regex.hasMatch(value)) {
        return 'ⓘ Please enter a valid date in the format MM/DD/YYYY';
      } else {
        return null;
      }
    }
  }
  static String? budgetValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Budget is required';
    } else {
      RegExp regex = RegExp(r'^\d{1,8}$');
      if (!regex.hasMatch(value)) {
        return 'ⓘ Please enter a valid budget with up to 8 digits';
      } else {
        return null;
      }
    }
  }
  static String? notesValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid';
    } else if (value.length < 6) {
      return 'Invalid';
    } else if (value.length > 3000) {
      return 'Invalid';
    } else {
      return null;
    }
  }
  static String? dobValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Date of Birth is required';
    } else {
      RegExp regex = RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$');
      if (!regex.hasMatch(value)) {
        return 'ⓘ Please enter a valid \ndate of birth in the \nformat MM/DD/YYYY';
      } else {
        // You can add additional checks here, such as validating the actual date.
        // For simplicity, this example only checks the format.
        return null;
      }
    }
  }



}
