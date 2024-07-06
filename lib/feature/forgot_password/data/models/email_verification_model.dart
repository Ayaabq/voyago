class Email {
  final String email;
  int? inCode;
  Email({
    required this.email,
    this.inCode,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "in_code": inCode,
    };
  }

  Email copyWith({
    String? email,
    int? inCode,
  }) {
    return Email(
      email: email ?? this.email,
      inCode: inCode ?? this.inCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'inCode': inCode,
    };
  }

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      email: map['email'] as String,
      inCode: map['inCode'] as int,
    );
  }
}
