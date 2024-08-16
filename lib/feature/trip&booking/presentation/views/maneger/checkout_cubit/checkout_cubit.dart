import 'package:bloc/bloc.dart';
import 'package:voyago/feature/books/data/models/edit_reservation_model.dart';
import 'package:voyago/feature/trip&booking/data/models/checkout/checkout_model.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import '../../../../data/models/checkout/optional_choice_model.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.tripDetailsRepo) : super(CheckoutInitial());
  final TripDetailsRepo tripDetailsRepo;
  int? adults=0;
  int? child=0;
  bool agree = false;
  String? email;
  String? phoneNumber;
  String? password;

  List<OptionalChoiceModel>? optionalChoices = [];
  void initCubit(int adults, int childe, String email, String phoneNumber,  List<OptionalChoiceModel> optionalChoices,){
    this.adults=adults;
    this.child=childe;
    this.phoneNumber=phoneNumber;
    this.email=email;
    this.optionalChoices=optionalChoices;
    this.password=password;
    emit(CheckoutLoaded(
      adults: adults,
      child: childe,
      email: email,
      phoneNumber: phoneNumber,
      password: password ?? '',
      optionalChoices:optionalChoices,
    ));

  }
  void updateAdults(int adults) {
    this.adults = adults;
    emit(CheckoutLoaded(
      adults: adults,
      child: child ?? 0,
      email: email ?? '',
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
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices ?? [],
    ));
  }

  void updateEmail(String email) {
    this.email = email;
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      email: email,
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
      email: email ?? '',
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
      email: email ?? '',
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
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices,
    ));
  }

  void addOptionalChoice(EventModel event) {
    bool exsist=false;
    for(var e in optionalChoices!){
      if (e.id==event.id) {
        exsist=true;
      }
    }
    if(!exsist) {
      optionalChoices!.add(OptionalChoiceModel(
        id: event.id, child: 0,
        adults: 0,
      adultPrice: event.priceAdult??0,
      childPrice: event.priceChild??0,
      title: event.title
    ));
    }
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices!,
    ));
  }

  void remOptionalChoice(int id) {
    // Check if optionalChoices is not null
    if (optionalChoices != null) {
      // Remove the optional choice with the given id
      optionalChoices!.removeWhere((choice) => choice.id == id);
    }

    // Emit the updated CheckoutLoaded state
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices!,
    ));
  }

  void addChildOptionalChoice(int id, int c) {
    if (optionalChoices != null) {
      for (var e in optionalChoices!) {
        if (e.id == id) {
          if(e.child +c >0) {
            e.child += c;
          }
        }
      }
    }
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices!,
    ));
  }

  void addAdultOptionalChoice(int id, int c) {
    if (optionalChoices != null) {
      for (var e in optionalChoices!) {
        if (e.id == id) {
          e.adults += c;
        }
      }
    }
    emit(CheckoutLoaded(
      adults: adults ?? 0,
      child: child ?? 0,
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      password: password ?? '',
      optionalChoices: optionalChoices!,
    ));
  }

  double getTotalPrice(double tripPrice) {
    double tot=0;
    tot+=(tripPrice*(child??0))+(tripPrice*adults!);
    for(var e in optionalChoices!){
      tot+=(e.adults * e.adultPrice);
      tot+=(e.child * e.childPrice);
    }
    return tot;
  }

  Future<void> submitCheckout(int id,bool isStripe) async {
    emit(CheckoutLoading());
      final checkout=CheckoutModel(
          adults: adults!,
          child: child!,
          phoneNumber: phoneNumber!,
          password: password!,
          optionalChoices: optionalChoices!,
          email: email!, isStripe: isStripe);
      final result= await tripDetailsRepo.submitCheckout(checkout, id);
      result.fold(
            (failure) {
          emit(CheckoutError(failure.errMessage));
        },
            (success) async{

          emit(CheckoutSuccess(success.message));
          await Future.delayed(const Duration(seconds: 1));
          emit(CheckoutLoaded(
            adults: adults ?? 0,
            child: child ?? 0,
            email: email ?? '',
            phoneNumber: phoneNumber ?? '',
            password: password ?? '',
            optionalChoices: optionalChoices!,
          ));
            },
      );
  }

 Future<void> editCheckout(int id) async {
    emit(CheckoutLoading());

      final reservation =EditReservation(
          adult: adults!,
          child: child!,
          reservedEvents: optionalChoices!=null?optionalChoices!.map((e)=>ReservedEvent(id: e.id, adult: e.adults, child: e.child)).toList(): [],
          email: email!, phone: phoneNumber!);
      final result= await tripDetailsRepo.editCheckout(reservation, id);
      result.fold(
            (failure) {
          emit(CheckoutError(failure.errMessage));
        },
            (success) async{

          emit(CheckoutSuccess(success.message));
          await Future.delayed(const Duration(seconds: 1));
          emit(CheckoutLoaded(
            adults: adults ?? 0,
            child: child ?? 0,
            email: email ?? '',
            phoneNumber: phoneNumber ?? '',
            password: password ?? '',
            optionalChoices: optionalChoices!,
          ));
            },
      );
  }

  void agreeToCondition() {
    agree = !agree;
  }
}
