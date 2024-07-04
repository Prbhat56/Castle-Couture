class DateAvailable {
  final int date;
  final String dateString;
  final List<int> localDate;
  final bool availableTimeSlot;
  final int timeSlotCount;
  final bool hasEvent;
  final bool blackOutDate;

  DateAvailable({
    required this.date,
    required this.dateString,
    required this.localDate,
    required this.availableTimeSlot,
    required this.timeSlotCount,
    required this.hasEvent,
    required this.blackOutDate,
  });

  factory DateAvailable.fromJson(Map<String, dynamic> json) {
    return DateAvailable(
      date: json['date'],
      dateString: json['dateString'],
      localDate: List<int>.from(json['localDate']),
      availableTimeSlot: json['availableTimeSlot'],
      timeSlotCount: json['timeSlotCount'],
      hasEvent: json['hasEvent'],
      blackOutDate: json['blackOutDate'],
    );
  }
}