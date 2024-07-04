class ProfileFormState {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String mobileNumber;
  final String email;
  final String address;

  // Validation flags
  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isDateOfBirthValid;
  final bool isMobileNumberValid;
  final bool isEmailValid;
  final bool isAddressValid;
  final bool isFormValid;

  ProfileFormState({
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth = '',
    this.mobileNumber = '',
    this.email = '',
    this.address = '',
    // Initialization of validation flags
    this.isFirstNameValid = true,
    this.isLastNameValid = true,
    this.isDateOfBirthValid = true,
    this.isMobileNumberValid = true,
    this.isEmailValid = true,
    this.isAddressValid = true,
    this.isFormValid = false,
  });

  ProfileFormState copyWith({
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? mobileNumber,
    String? email,
    String? address,
    bool? isFirstNameValid,
    bool? isLastNameValid,
    bool? isDateOfBirthValid,
    bool? isMobileNumberValid,
    bool? isEmailValid,
    bool? isAddressValid,
    bool? isFormValid,
  }) {
    return ProfileFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isDateOfBirthValid: isDateOfBirthValid ?? this.isDateOfBirthValid,
      isMobileNumberValid: isMobileNumberValid ?? this.isMobileNumberValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isAddressValid: isAddressValid ?? this.isAddressValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
