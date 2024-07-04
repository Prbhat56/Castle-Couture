class AvailableTimeSlot {
  final int? typeId;
  final int? fittingRoomId;
  final int? startDateTime;
  final int? endDateTime;
  final String? fittingRoomDescription;
  final String? startDateTimeForView;

  AvailableTimeSlot({
    this.typeId,
    this.fittingRoomId,
    this.startDateTime,
    this.endDateTime,
    this.fittingRoomDescription,
    this.startDateTimeForView,
  });

  factory AvailableTimeSlot.fromJson(Map<String, dynamic> json) {
    return AvailableTimeSlot(
      typeId: json['typeId'],
      fittingRoomId: json['fittingRoomId'],
      startDateTime: json['startDateTime'],
      endDateTime: json['endDateTime'],
      fittingRoomDescription: json['fittingRoomDescription'],
      startDateTimeForView: json['startDateTimeForView'],
    );
  }
}
