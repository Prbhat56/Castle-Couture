class AddressFormState {
  final String? address;
  final String? city;
  final String? countryDropdown;
  final String? zipCode;

  // Validation flags

  final bool isAddressValid;
  final bool isCityValid;
  final bool isCountryDropdownValid;
  final bool isZipCodeValid;
  final bool isFormValid;

  const AddressFormState({
    // Initialization of validation flags

    this.address,
    this.city,
    this.countryDropdown,
    this.zipCode,
    this.isAddressValid = false,
    this.isCityValid = false,
    this.isCountryDropdownValid = false,
    this.isZipCodeValid = false,
    this.isFormValid = false,
  });

  AddressFormState copyWith({
    String? address,
    String? city,
    String? countryDropdown,
    String? zipCode,
    bool? isAddressValid,
    bool? isCityValid,
    bool? isCountryDropdownValid,
    bool? isZipCodeValid,
    bool? isFormValid,
  }) {
    return AddressFormState(
      address: address ?? this.address,
      city: city ?? this.city,
      countryDropdown: countryDropdown ?? this.countryDropdown,
      zipCode: zipCode ?? this.zipCode,
      isAddressValid: isAddressValid ?? this.isAddressValid,
      isCityValid: isCityValid ?? this.isCityValid,
      isCountryDropdownValid:
          isCountryDropdownValid ?? this.isCountryDropdownValid,
      isZipCodeValid: isZipCodeValid ?? this.isZipCodeValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
