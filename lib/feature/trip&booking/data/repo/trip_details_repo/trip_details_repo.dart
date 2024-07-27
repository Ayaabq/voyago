
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/optional_choices_cubit/optional_choices_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_state.dart';

import '../../../presentation/views/maneger/checkout_cubit/checkout_state.dart';
import '../../../presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';
import '../../models/checkout/checkout_model.dart';



abstract class TripDetailsRepo {
  Future<Either<Failure, TripInfo1Success>>
  getTripInfo1(int id);
  Future<Either<Failure, TripInfo2Success>>
  getTripInfo2(int id);
  Future<Either<Failure, TripInfo3PlacesSuccess>>
  getTripInfo3(int id);
  Future<Either<Failure, ItinerarySuccess>>
  itinerary(int id);
  Future<Either<Failure, OptionalEventSuccess>>
  getOptionalEvent(int id);
  Future<Either<Failure, CheckoutSuccess>>submitCheckout(CheckoutModel checkout)  ;

}
