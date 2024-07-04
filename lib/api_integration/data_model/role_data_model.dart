class Role {
  final int id;
  final int createdDate;
  final String retailerId;
  final String description;
  final String status;

  Role({
    required this.id,
    required this.createdDate,
    required this.retailerId,
    required this.description,
    required this.status,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      createdDate: json['createdDate'],
      retailerId: json['retailerId'],
      description: json['description'],
      status: json['status'],
    );
  }
}
