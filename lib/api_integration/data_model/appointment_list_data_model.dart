class AppointmentList {
  final int id;
  final int fittingRoomId;
  final int startDateTime;
  final int endDateTime;
  final int duration;

  AppointmentList({
    required this.id,
    required this.fittingRoomId,
    required this.startDateTime,
    required this.endDateTime,
    required  this.duration,
  });

  factory AppointmentList.fromJson(Map<String, dynamic> json) {
    return AppointmentList(
      id: json['id'] ?? 0,
      fittingRoomId: json['fittingRoomId'] ?? 0,
      startDateTime: json['startDateTime'] ?? 0,
      endDateTime: json['endDateTime'] ?? 0,
      duration: json['duration'] ?? 0,
    );
  }
}