import 'package:equatable/equatable.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/search/data/models/search_trip_model.dart';

abstract class TripsSearchState extends Equatable {
  const TripsSearchState();

  @override
  List<Object?> get props => [];
}

class TripsSearchInitial extends TripsSearchState {}

class TripsSearchLoading extends TripsSearchState {}

class TripsSearchSuccess extends TripsSearchState {
  final List<TripSearchModel> tripModels;

  const TripsSearchSuccess(this.tripModels);

  @override
  List<Object?> get props => [tripModels];

  static TripsSearchSuccess fromJson(Map<String, dynamic> response) {
    final  List<TripSearchModel> trips;

      trips = (response['data']['trips_1'] as List)
          .map((e) => TripSearchModel.fromJson(e))
          .toList();

    return TripsSearchSuccess(trips);
  }
}

class TripsSearchFailure extends TripsSearchState {
  final String errorMessage;

  const TripsSearchFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  static TripsSearchFailure fromJson(Map<String, dynamic> response) {
    return TripsSearchFailure(response['err'] ?? 'Unknown error');
  }
}
