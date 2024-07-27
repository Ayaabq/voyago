import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import '../../../../data/models/checkout/optional_choice_model.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.tripDetailsRepo) : super(CheckoutInitial());
  final TripDetailsRepo tripDetailsRepo;
  int? adults;
  int? child;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  List<OptionalChoiceModel>? optionalChoices;

  void updateAdults(int adults) {
    this.adults = adults;
    emit(CheckoutLoaded(
      adults: adults,
      child: child ?? 0,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updateChild(int child) {
    this.child = child;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updateFirstName(String firstName) {
    this.firstName = firstName;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      firstName: firstName,
      lastName: lastName ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updateLastName(String lastName) {
    this.lastName = lastName;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      firstName: firstName ?? '',
      lastName: lastName,
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updatePhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phoneNumber: phoneNumber,
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updatePassword(String password) {
    this.password = password;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password,
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updateOptionalChoices(List<OptionalChoiceModel> optionalChoices) {
    this.optionalChoices = optionalChoices;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices,
    ));
  }

  void submitCheckout() async {
    emit(CheckoutLoading());
    try {
      // Here you would call your repository to submit the data
      // For example: await repository.submitCheckout(...)
      emit(CheckoutLoaded(
        adults: adults!,
        child: child!,
        firstName: firstName!,
        lastName: lastName!,
        phoneNumber: phoneNumber!,
        password: password!,
        optionalChoices: optionalChoices!,
      ));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
