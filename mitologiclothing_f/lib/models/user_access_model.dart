class UserAccessModel {
  final String name;
  final String phone;
  final String userDescription;

  const UserAccessModel({
    required this.name,
    required this.phone,
    required this.userDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'user_description': userDescription,
    };
  }

  factory UserAccessModel.fromJson(Map<String, dynamic> json) {
    return UserAccessModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      userDescription: json['user_description'] ?? '',
    );
  }
}