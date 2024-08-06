

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';
import 'package:voyago/feature/notification/data/model/notification_model.dart';

import 'package:equatable/equatable.dart';

import '../../../../attraction/data/models/attraction_model.dart';
import '../../../../trip&booking/data/models/trip_model.dart';

abstract class FavoriteState extends Equatable{

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<DestinationModel> destinations;
  final List<AttractionModel> attractions;
  final List<TripModel> trips;

  FavoriteSuccess(this.destinations, this.attractions, this.trips);
  @override
  List<Object?> get props => [destinations,attractions,trips];
  static FavoriteSuccess fromJson(Map<String, dynamic> response) {
    final favorites = (response['data']);
       final trips=(favorites['trips'] as List) .map((e) => TripModel.fromJson(e))
        .toList();
       final destinations=(favorites['destenation'] as List).map((e) => DestinationModel.fromJson(e))
           .toList();
       final attractions=(favorites['attraction'] as List).map((e) => AttractionModel.fromJson(e))
           .toList();
    return FavoriteSuccess(destinations,attractions,trips);
  }
}


class FavoriteFailure extends FavoriteState {
  final String errorMessage;
  FavoriteFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static FavoriteFailure fromJson(Map<String, dynamic> response) {
    return FavoriteFailure(response['err'] ?? 'Unknown error');
  }



}
