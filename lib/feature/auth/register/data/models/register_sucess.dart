class RegisterSuccessResp {
  final String message;

  RegisterSuccessResp({required this.message});

  factory RegisterSuccessResp.fromJson(Map<String, dynamic> json) {
    return RegisterSuccessResp(
      message: json['message'] ?? '',
    );
  }
}
