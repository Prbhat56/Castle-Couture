class AppointmentNewType {
  final String id;
  final String description;
  final int? duration;         // Nullable int
  final int bookingitemid;     // Non-nullable int

  AppointmentNewType({
    required this.id,
    required this.description,
    this.duration,             // Nullable int
    required this.bookingitemid,
  });

  factory AppointmentNewType.fromJson(Map<String, dynamic> json) {
    return AppointmentNewType(
      id: json['id'].toString(),
      description: json['description'] ?? '', // Default to empty string if null
      duration: json['duration'],             // Keep as nullable
      bookingitemid: json['bookingItemId'] ?? 0, // Default to 0 if null
    );
  }
}
