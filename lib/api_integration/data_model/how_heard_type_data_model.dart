class HowHeardType {
  final int id;
  final String description;
  final String status;

  HowHeardType({
    required this.id,
    required this.description,
    required this.status,
  });

  factory HowHeardType.fromJson(Map<String, dynamic> json) {
    return HowHeardType(
      id: json['id'],
      description: json['description'],
      status: json['status'],
    );
  }
}
