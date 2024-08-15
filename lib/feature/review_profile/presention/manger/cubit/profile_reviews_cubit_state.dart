import 'package:equatable/equatable.dart';
import 'package:voyago/feature/review_profile/data/models/trip_model.dart';

import '../../../../books/data/models/books_model.dart';
import '../../../data/models/attration_model.dart';
import '../../../data/models/destination_model.dart';

abstract class ReviewsProfState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewsProfInitial extends ReviewsProfState {}

class ReviewsProfLoading extends ReviewsProfState {}

class ReviewsProfSuccess extends ReviewsProfState {
  final List<DestinationRev> destinations;
  final List<AttrationRev> attractions;
  final List<TripModelRev> trips;

  ReviewsProfSuccess(this.destinations, this.attractions, this.trips);
  @override
  List<Object?> get props => [destinations, attractions, trips];
  // static ReviewsProfSuccess fromJson(Map<String, dynamic> response) {
  //   final reviews = (response['data']);
  //   final trips =
  //       (reviews['trips'] as List).map((e) => TripModelRev.fromJson(e)).toList();
  //   final destinations = (reviews['destenation'] as List)
  //       .map((e) => DestinationRev.fromJson(e))
  //       .toList();
  //   final attractions = (reviews['attraction'] as List)
  //       .map((e) => AttrationRev.fromJson(e))
  //       .toList();
  //   return ReviewsProfSuccess(destinations, attractions, trips);
  // }

static ReviewsProfSuccess fromJson(Map<String, dynamic> response) {
  final reviews = response['data'] ?? {};
  final trips = (reviews['trip_n'] as List?)?.map((e) => TripModelRev.fromJson(e)).toList() ?? [];
  final destinations = (reviews['dest_n'] as List?)?.map((e) => DestinationRev.fromJson(e)).toList() ?? [];
  final attractions = (reviews['attr_n'] as List?)?.map((e) => AttrationRev.fromJson(e)).toList() ?? [];
 print('Trips: ${trips.length}, Destinations: ${destinations.length}, Attractions: ${attractions.length}');
  return ReviewsProfSuccess(destinations, attractions, trips);

}

}

class ReviewsProfFailure extends ReviewsProfState {
  final String errorMessage;
  ReviewsProfFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static ReviewsProfFailure fromJson(Map<String, dynamic> response) {
    return ReviewsProfFailure(response['err'] ?? 'Unknown error');
  }
}
