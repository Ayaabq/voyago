import 'optional_choice_model.dart';

class CheckoutModel {
  int child;
  int adults;
  String firstName;
  String lastName;
  String phoneNumber;
  String password;
  List<OptionalChoiceModel> optionalChoices;

  CheckoutModel({
    required this.adults,
    required this.child,
    required this.firstName,
    required this.lastName,
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
      firstName: json['first_name'],
      lastName: json['last_name'],
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
      'first_name': firstName,
      'last_name': lastName,
      'phone': phoneNumber,
      'password': password,
      'optional_choices': optionalChoicesToJson,
    };
  }
}

