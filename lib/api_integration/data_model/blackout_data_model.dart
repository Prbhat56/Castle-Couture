class BlackoutDate {
  final int id;
  final int startDateTime;
  final int endDateTime;
  final String? comment;

  BlackoutDate({
    required this.id,
    required this.startDateTime,
    required this.endDateTime,
    this.comment,
  });

  factory BlackoutDate.fromJson(Map<String, dynamic> json) {
    return BlackoutDate(
      id: json['id'],
      startDateTime: json['startDateTime'],
      endDateTime: json['endDateTime'],
      comment: json['comment'],
    );
  }
}
