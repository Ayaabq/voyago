import 'package:equatable/equatable.dart';
import '../../../../data/models/checkout/optional_choice_model.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final int adults;
  final int child;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final List<OptionalChoiceModel> optionalChoices;

  const CheckoutLoaded({
    required this.adults,
    required this.child,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.optionalChoices,
  });

  @override
  List<Object?> get props => [adults, child, firstName, lastName, phoneNumber, password, optionalChoices];
}

class CheckoutError extends CheckoutState {
  final String message;

  const CheckoutError(this.message);

  @override
  List<Object?> get props => [message];

  static CheckoutError fromJson(Map<String, dynamic> response) {
  return CheckoutError(response['err'] ?? 'Unknown error');

}
}

class CheckoutSuccess extends CheckoutState{
  final String message;

  const CheckoutSuccess( this.message);
  static CheckoutSuccess fromJson(Map<String, dynamic> response) {
    return CheckoutSuccess(response['msg'] ?? 'done');

  }
}
