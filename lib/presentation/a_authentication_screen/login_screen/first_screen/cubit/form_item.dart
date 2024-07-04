class FirstScreenBlocFormItem {
  final String? error;
  final String value;
  const FirstScreenBlocFormItem({this.error, this.value = ''});

  FirstScreenBlocFormItem copyWith({
    String? error,
    String? value,
  }) {
    return FirstScreenBlocFormItem(
      error: error ?? this.error,
      value: value ?? this.value,
    );
  }
}