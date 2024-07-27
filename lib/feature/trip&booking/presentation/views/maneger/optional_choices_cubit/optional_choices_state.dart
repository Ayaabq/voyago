//
//
//
//
//
// import '../../../../data/models/trip_model.dart';
//
// abstract class TripsState {}
//
// class TripsInitial extends TripsState {}
//
// class TripsLoading extends TripsState {}
//
// class TripsSuccess extends TripsState {
//   final List<TripModel> tripModels;
//
//   TripsSuccess(this.tripModels);
//
//   static TripsSuccess fromJson(Map<String, dynamic> response) {
//     final trips = (response['data']['result'] as List)
//         .map((e) => TripModel.fromJson(e))
//         .toList();
//     return TripsSuccess(trips);
//   }
// }
//
//
// class TripsFailure extends TripsState {
//   final String errorMessage;
//   TripsFailure(this.errorMessage);
//
//   static TripsFailure fromJson(Map<String, dynamic> response) {
//     return TripsFailure(response['err'] ?? 'Unknown error');
//   }
//
//
//
// }
import 'package:equatable/equatable.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';

abstract class OptionalEventState extends Equatable {
  const OptionalEventState();

  @override
  List<Object?> get props => [];
}

class OptionalEventInitial extends OptionalEventState {}

class OptionalEventLoading extends OptionalEventState {}

class OptionalEventSuccess extends OptionalEventState {
  final List<EventModel> events;

  const OptionalEventSuccess(this.events);

  @override
  List<Object?> get props => [events];

  static OptionalEventSuccess fromJson(Map<String, dynamic> response) {
    final  List<EventModel> trips;
      trips = (response['data'] as List)
          .map((e) => EventModel.fromJson(e))
          .toList();

    return OptionalEventSuccess(trips);
  }
}

class OptionalEventFailure extends OptionalEventState {
  final String errorMessage;

  const OptionalEventFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  static OptionalEventFailure fromJson(Map<String, dynamic> response) {
    return OptionalEventFailure(response['err'] ?? 'Unknown error');
  }
}
