import 'optional_choice_model.dart';

class CheckoutModel {
  int child;
  int adults;
  String email;

  String phoneNumber;
  String password;
  List<OptionalChoiceModel> optionalChoices;

  CheckoutModel({
    required this.adults,
    required this.child,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.optionalChoices,
  });

  // Factory constructor to create an instance from JSON
  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    var optionalChoicesFromJson = json['optional_choices'] as List;
    List<OptionalChoiceModel> optionalChoicesList = optionalChoicesFromJson.map((i) => OptionalChoiceModel.fromJson(i)).toList();

    return CheckoutModel(
      adults: json['adult'],
      child: json['child'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password'],
      optionalChoices: optionalChoicesList,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> optionalChoicesToJson = optionalChoices.map((i) => i.toJson()).toList();

    return {
      'adult': adults,
      'child': child,
      'email': email,

      'phone': phoneNumber,
      'password': password,
      'optional_choices': optionalChoicesToJson,
    };
  }
}

