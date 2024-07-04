class EmployeeList {
  final int id;
  final String emailAddress;
  final String profileImageUrl;
  final String mobilenumber1;
    final String mobilenumber2;
      final String mobilenumber3;
   // Add lastName field

  EmployeeList({required this.id, required this.emailAddress, required this.profileImageUrl,required this.mobilenumber1,required this.mobilenumber2,required this.mobilenumber3});

  factory EmployeeList.fromJson(Map<String, dynamic> json) {
    return EmployeeList(
      id: json['id'],
      emailAddress: json['emailAddress'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      mobilenumber1: json['mobilePhoneNumber'] ??'',
      mobilenumber2: json['workPhoneNumber']??'',
      mobilenumber3: json['homePhoneNumber']??'',
    );
  }
}
