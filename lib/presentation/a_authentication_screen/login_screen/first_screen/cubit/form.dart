class CustomFirstScreenFormState {
  final String email;
  final String password;

  // Validation flags
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isPasswordVisible;
  final bool isFormValid;

  // Constructor with default values
  const CustomFirstScreenFormState({
    this.email = '',
    this.password = '',
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isPasswordVisible = false,
    this.isFormValid = false,
  });

  // Copy with method for immutable update
  CustomFirstScreenFormState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isPasswordVisible,
    bool? isFormValid,
  }) {
    return CustomFirstScreenFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
