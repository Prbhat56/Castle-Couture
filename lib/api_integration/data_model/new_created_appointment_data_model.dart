class MappedAppointment {
  final int id;
  final int typeId;
  final int contactId;
  final int employeeId;
  final int fittingRoomId;
  final int startDateTime;
  final int endDateTime;
  final int? budget;
  final String notes;
  final String contactEventDate;
  final String typeDescription;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? zip;
  final String? country;
  final String? contactName;
  final String? typedescription;
  final int? duration;
  final String? email;
  final String? bestphonenumber;
  final String? eventdate;

  MappedAppointment(
      {required this.id,
      required this.typeId,
      required this.contactId,
      required this.employeeId,
      required this.fittingRoomId,
      required this.startDateTime,
      required this.endDateTime,
      required this.notes,
      required this.contactEventDate,
      required this.typeDescription,
      this.budget,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.contactName,
      this.typedescription,
      this.duration,
      this.bestphonenumber,
      this.email,
      this.eventdate});

  factory MappedAppointment.fromJson(Map<String, dynamic> json) {
    return MappedAppointment(
        budget: json['budget'] ?? 0,
        id: json["id"],
        typeId: json['typeId'],
        contactId: json['contactId'],
        employeeId: json['employeeId'],
        fittingRoomId: json['fittingRoomId'],
        startDateTime:
            json['startDateTime'] ?? 0, // Provide a default value if null
        endDateTime:
            json['endDateTime'] ?? 0, // Provide a default value if null
        notes: json['notes'] ?? "HDEHBBDEHJBEH",
        contactEventDate: json['contactEventDate'] ?? "HDEHDEDNE",
        typeDescription: json['typeDescription'] ?? "CBNFDNHNF",
        address1: json['address1'] ?? "DEEDEDEEDE",
        address2: json['address2'] ?? '',
        city: json['city'] ?? "EDDEEDED",
        state: json['state'] ?? "EDEDE",
        zip: json['zip'] ?? "EFEFEF",
        country: json['country'] ?? "DEEDED",
        contactName: json["contactName"] ?? "navin 67",
        typedescription: json["typeDescription"] ?? "Accessories",
        duration: json["duration"] ?? 56,
        bestphonenumber: json["bestPhoneNumber"] ?? "9876543211",
        email: json["email"] ?? "nagaon2gmail.com",
        eventdate: json["contactEventDate"] ?? "2024-12-20");
  }
}
