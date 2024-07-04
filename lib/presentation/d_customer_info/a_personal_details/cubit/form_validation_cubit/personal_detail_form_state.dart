
class PersonalDetailFormState {
  final String? firstName;
  final String? lastName;
  final String? mobileDropdown;
  final String? phoneNumber;
  final String? email;

  // Validation flags

  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isMobileDropdownValid;
  final bool isMobileNumberValid;
  final bool isEmailValid;
  final bool isCheckboxValid;
  final bool isFormValid;

  const PersonalDetailFormState({
    // Initialization of validation flags

    this.firstName,
    this.lastName,
    this.mobileDropdown="Mobile",
    this.phoneNumber,
    this.email,
    this.isFirstNameValid = false,
    this.isLastNameValid = false,
    this.isMobileDropdownValid = false,
    this.isMobileNumberValid = false,
    this.isEmailValid = false,
    this.isCheckboxValid = false,
    this.isFormValid = false,
  });

  PersonalDetailFormState copyWith({
    String? firstName,
    String? lastName,
    String? mobileDropdown,
    String? phoneNumber,
    String? email,
    bool? isFirstNameValid,
    bool? isLastNameValid,
    bool? isMobileDropdownValid,
    bool? isMobileNumberValid,
    bool? isEmailValid,
    bool? isCheckboxValid,
    bool? isFormValid,
  }) {
    return PersonalDetailFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobileDropdown: mobileDropdown ?? this.mobileDropdown,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isMobileDropdownValid:
          isMobileDropdownValid ?? this.isMobileDropdownValid,
      isMobileNumberValid: isMobileNumberValid ?? this.isMobileNumberValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isCheckboxValid: isCheckboxValid ?? this.isCheckboxValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
