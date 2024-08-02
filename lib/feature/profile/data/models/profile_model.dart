// class ProfileModel {
//   String name;
//   String email;

//   ProfileModel({
//     required this.name,
//     required this.email,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       name: json['name'],
//       email: json["email"],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//     };
//   }
// }


class ProfileModel {
  final String name;
  final String email;

  ProfileModel({
    required this.name,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['data']['name'],
      email: json['data']['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
