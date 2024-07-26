
import 'package:voyago/feature/trip&booking/data/models/itinerary/itinerary_day_model.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';


abstract class ItineraryState {}

class ItineraryInitial extends ItineraryState {}

class ItineraryLoading extends ItineraryState {}

class ItinerarySuccess extends ItineraryState {
  final List<ItineraryDay> itineraryDays;

  ItinerarySuccess(this.itineraryDays);

  static ItinerarySuccess fromJson(Map<String, dynamic> response) {
    final days = (response['data']as List)
        .map((e) => ItineraryDay.fromJson(e))
        .toList();
    return ItinerarySuccess(days);
  }
}


class ItineraryFailure extends ItineraryState {
  final String errorMessage;
  ItineraryFailure(this.errorMessage);

  static ItineraryFailure fromJson(Map<String, dynamic> response) {
    return ItineraryFailure(response['err'] ?? 'Unknown error');
  }



}