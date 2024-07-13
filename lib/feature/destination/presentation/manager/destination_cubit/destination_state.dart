

import '../../../data/models/destination_model.dart';

abstract class DestinationState {}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destinationModels;

  DestinationSuccess(this.destinationModels);

  static DestinationSuccess fromJson(Map<String, dynamic> response) {
    final destinations = (response['data']['result'] as List)
        .map((e) => DestinationModel.fromJson(e))
        .toList();
    return DestinationSuccess(destinations);
  }
}


class TrendingDestinationFailure extends DestinationState {
  final String errorMessage;
  TrendingDestinationFailure(this.errorMessage);

  static TrendingDestinationFailure fromJson(Map<String, dynamic> response) {
    return TrendingDestinationFailure(response['err'] ?? 'Unknown error');
  }



}
