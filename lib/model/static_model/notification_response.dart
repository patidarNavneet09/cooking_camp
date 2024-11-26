class NotificationModel {
  final String id;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory constructor to create a UserModel from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'email': email,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
