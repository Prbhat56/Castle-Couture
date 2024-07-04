class MappedContact {
  final int id;
  final String? firstname;
  final String? lastname;
  final String? address1;
  final String? address2;
  final String? city;
  final String? email;
  final String? bestphonenumber;
  MappedContact(
      {required this.id,
      this.address1,
      this.address2,
      this.city,
      this.bestphonenumber,
      this.email,
      this.firstname,
      this.lastname});

  factory MappedContact.fromJson(Map<String, dynamic> json) {
    return MappedContact(
      id: json["id"],
      firstname: json["firstName"] ?? "ram",
      lastname: json["lastName"] ?? "kumar",
      address1: json['address1'] ?? "DEEDEDEEDE",
      address2: json['address2'] ?? 'rtrgrt',
      city: json['city'] ?? "EDDEEDED",
      bestphonenumber: json["bestPhoneNumber"] ?? "9876543211",
      email: json["emailAddress"] ?? "nagaon2gmail.com",
    );
  }
}
