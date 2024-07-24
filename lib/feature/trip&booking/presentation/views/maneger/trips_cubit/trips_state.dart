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
import 'package:voyago/core/utils/confg.dart';
import '../../../../data/models/trip_model.dart';

abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object?> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsSuccess extends TripsState {
  final List<TripModel> tripModels;

  const TripsSuccess(this.tripModels);

  @override
  List<Object?> get props => [tripModels];

  static TripsSuccess fromJson(Map<String, dynamic> response, bool inData) {
    final  List<TripModel> trips;
    if(inData) {
      trips = (response['data'] as List)
          .map((e) => TripModel.fromJson(e))
          .toList();
    } else {
      trips = (response['data']['result'] as List)
        .map((e) => TripModel.fromJson(e))
        .toList();
    }
    return TripsSuccess(trips);
  }
}

class TripsFailure extends TripsState {
  final String errorMessage;

  const TripsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  static TripsFailure fromJson(Map<String, dynamic> response) {
    return TripsFailure(response['err'] ?? 'Unknown error');
  }
}
