class PaymentFormState {
  final String? cardHolderName;
  final String? cardNumber;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cvv;
  final bool isCardHolderNameValid;
  final bool isCardNumberValid;
  final bool isExpiryMonthValid;
  final bool isExpiryYearValid;
  final bool isCvvValid;
  final bool isCheckBoxChecked;
  final bool isFormValid;

  const PaymentFormState({
    this.cardHolderName,
    this.cardNumber,
    this.expiryMonth,
    this.expiryYear,
    this.cvv,
    this.isCardHolderNameValid = false,
    this.isCardNumberValid = false,
    this.isExpiryMonthValid = false,
    this.isExpiryYearValid = false,
    this.isCvvValid = false,
    this.isCheckBoxChecked = false,
    this.isFormValid = false,
  });

  PaymentFormState copyWith({
    String? cardHolderName,
    String? cardNumber,
    String? expiryMonth,
    String? expiryYear,
    String? cvv,
    bool? isCardHolderNameValid,
    bool? isCardNumberValid,
    bool? isExpiryMonthValid,
    bool? isExpiryYearValid,
    bool? isCvvValid,
    bool? isCheckBoxChecked,
    bool? isFormValid,
  }) {
    return PaymentFormState(
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      cvv: cvv ?? this.cvv,
      isCardHolderNameValid: isCardHolderNameValid ?? this.isCardHolderNameValid,
      isCardNumberValid: isCardNumberValid ?? this.isCardNumberValid,
      isExpiryMonthValid: isExpiryMonthValid ?? this.isExpiryMonthValid,
      isExpiryYearValid: isExpiryYearValid ?? this.isExpiryYearValid,
      isCvvValid: isCvvValid ?? this.isCvvValid,
      isCheckBoxChecked: isCheckBoxChecked ?? this.isCheckBoxChecked,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
