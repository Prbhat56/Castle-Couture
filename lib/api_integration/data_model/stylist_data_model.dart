class Stylist {
  final int id;
  final String description;

  Stylist({required this.id, required this.description});

  factory Stylist.fromJson(Map<String, dynamic> json) {
    return Stylist(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
    );
  }
}