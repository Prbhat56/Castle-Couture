class CreditCardValidator {
  static String? cardHolderNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Card holder name is required';
    } else if (value.length < 2) {
      return 'ⓘ Card holder name should be at least 2 characters long';
    } else if (value.length > 50) {
      return 'ⓘ Card holder name should not exceed 50 characters';
    } else {
      return null;
    }
  }

  static String? cardNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Card number is required';
    } else if (value.length != 16 || !isNumeric(value)) {
      return 'ⓘ Invalid card number';
    } else {
      return null;
    }
  }

  // static String? expiryMonthValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'ⓘ Expiry month is required';
  //   } else if (!isNumeric(value) || int.tryParse(value) == null || int.parse(value) < 1 || int.parse(value) > 12) {
  //     return 'ⓘ Invalid expiry month';
  //   } 
    
  //   else {
  //     return null;
  //   }
  // }


  static String? expiryMonthValidator(String? value, String? expiryYear) {
  if (value == null || value.isEmpty) {
    return 'ⓘ Expiry month is required';
  } else if (!isNumeric(value) || int.tryParse(value) == null || int.parse(value) < 1 || int.parse(value) > 12) {
    return 'ⓘ Invalid expiry month';
  } else if (expiryYear != null && int.tryParse(expiryYear) == DateTime.now().year) {
    int currentMonth = DateTime.now().month;
    int selectedMonth = int.parse(value);
    if (selectedMonth <= currentMonth) {
      return 'ⓘ Expiry month must be \n at least one month ahead';
    }
  }
  return null;
}

  static String? expiryYearValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Expiry year is required';
    }

    int? parsedYear = int.tryParse(value);

    if (parsedYear == null || !isNumeric(value)) {
      return 'ⓘ Invalid expiry year';
    } else if (parsedYear < DateTime.now().year || parsedYear > 2050) {
      return 'ⓘ Expiry year must \n be between \n ${DateTime.now().year} and 2050';
    } else {
      return null;
    }
  }


  static String? cvvValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ CVV is required';
    } else if (value.length != 3 || !isNumeric(value)) {
      return 'ⓘ Invalid CVV';
    } else {
      return null;
    }
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
}
