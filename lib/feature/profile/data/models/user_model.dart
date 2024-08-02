class UserModel {
  final String username;
  final String email;
  final String? phone;
  final String? location;

  UserModel({
    required this.username,
    required this.email,
    this.phone,
    this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['data']['username'],
      email: json['data']['email'],
      phone: json['data']['phone'],
      location: json['data']['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'location': location,
    };
  }
}
