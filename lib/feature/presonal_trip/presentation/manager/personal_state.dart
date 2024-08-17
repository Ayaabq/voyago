
import 'package:flutter/cupertino.dart';

import '../../data/personal_trip_model.dart';

@immutable
abstract class PersonalTripState {}

class PersonalTripInitial extends PersonalTripState {}

class PersonalTripUpdated extends PersonalTripState {
  final PersonalTripModel personalTrip;

  PersonalTripUpdated(this.personalTrip);
}
