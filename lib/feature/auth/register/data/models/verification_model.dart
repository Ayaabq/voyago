class VerificationModel {
  final String correctCode;
  String inCode;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  VerificationModel({
    required this.correctCode,
     this.inCode = "",
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "correct_code": correctCode,
      "in_code": inCode,
      "username": username,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
    };
  }
}
