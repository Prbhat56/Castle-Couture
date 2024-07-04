class OtherDetailFormState {
  final String? howHeardDropdown;
  final String? eventDate;
  final String? budget;
  final String? stylistDropdown;
  final String? notes;

  // Validation flags

  final bool isHowHeardDropdownValid;
  final bool isEventDateValid;
  final bool isBudgetValid;
  final bool isStylistDropdownValid;
  final bool isNotesValid;
  final bool isFormValid;

  const OtherDetailFormState({
    // Initialization of validation flags

    this.howHeardDropdown,
    this.eventDate,
    this.budget,
    this.stylistDropdown,
    this.notes,
    this.isHowHeardDropdownValid = false,
    this.isEventDateValid = false,
    this.isBudgetValid = false,
    this.isStylistDropdownValid = false,
    this.isNotesValid = false,
    this.isFormValid = false,
  });
  OtherDetailFormState copyWith({
    String? howHeardDropdown,
    String? eventDate,
    String? budget,
    String? stylistDropdown,
    String? notes,
    bool? isHowHeardDropdownValid,
    bool? isEventDateValid,
    bool? isBudgetValid,
    bool? isStylistDropdownValid,
    bool? isNotesValid,
    bool? isFormValid,
  }) {
    return OtherDetailFormState(
      howHeardDropdown: howHeardDropdown ?? this.howHeardDropdown,
      eventDate: eventDate ?? this.eventDate,
      budget: budget ?? this.budget,
      stylistDropdown: stylistDropdown ?? this.stylistDropdown,
      notes: notes ?? this.notes,
      isHowHeardDropdownValid: isHowHeardDropdownValid ?? this.isHowHeardDropdownValid,
      isEventDateValid: isEventDateValid ?? this.isEventDateValid,
      isBudgetValid: isBudgetValid ?? this.isBudgetValid,
      isStylistDropdownValid: isStylistDropdownValid ?? this.isStylistDropdownValid,
      isNotesValid: isNotesValid ?? this.isNotesValid,

      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}