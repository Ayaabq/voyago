

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


class DestinationFailure extends DestinationState {
  final String errorMessage;
  DestinationFailure(this.errorMessage);

  static DestinationFailure fromJson(Map<String, dynamic> response) {
    return DestinationFailure(response['err'] ?? 'Unknown error');
  }



}
