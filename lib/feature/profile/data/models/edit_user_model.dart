// class EditUser {
//   final String username;
//   final String country;
//   final String phoneNumber;
//   final String oldPassword;
//   final String password;
//   final String confirmPassword;

//   EditUser(
//       {required this.username,
//       required this.country,
//       required this.phoneNumber,
//       required this.oldPassword,
//       required this.password,
//       required this.confirmPassword});

//   factory EditUser.fromJson(Map<String, dynamic> json) {
//     return EditUser(
//       username: json['username'],
//       country: json['country'],
//       phoneNumber: json['phone_number'],
//       oldPassword: json['old password'],
//       password: json['password'],
//       confirmPassword: json['confirm password'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data[' username '] = username;
//     data['country'] = country;
//     data[' phone_number'] = phoneNumber;
//     data['old password '] = oldPassword;
//     data[' password '] = password;
//     data['confirm password '] = confirmPassword;
//     return data;
//   }
// }


class EditUser {
  String username;
  String country;
  String phoneNumber;
  String oldPassword;
  String password;
  String confirmPassword;

  EditUser({
    required this.username,
    required this.country,
    required this.phoneNumber,
    required this.oldPassword,
    required this.password,
    required this.confirmPassword,
  });

  // تحويل من JSON إلى Object
  factory EditUser.fromJson(Map<String, dynamic> json) {
    return EditUser(
      username: json['username'],
      country: json['country'],
      phoneNumber: json['phone_number'],
      oldPassword: json['old_password'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }

  // تحويل من Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'country': country,
      'phone_number': phoneNumber,
      'old_password': oldPassword,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
