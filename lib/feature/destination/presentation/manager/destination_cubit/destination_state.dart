

import '../../../data/models/destination_model.dart';
import 'package:equatable/equatable.dart';

abstract class DestinationState extends Equatable{

  @override
  List<Object?> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destinationModels;

  DestinationSuccess(this.destinationModels);
  @override
  List<Object?> get props => [destinationModels];
  static DestinationSuccess fromJson(Map<String, dynamic> response, bool in_data) {
    final destinations;
    if(in_data)
     destinations = (response['data']as List)
        .map((e) => DestinationModel.fromJson(e))
        .toList();
    else
     destinations = (response['data']['result'] as List)
        .map((e) => DestinationModel.fromJson(e))
        .toList();

    return DestinationSuccess(destinations);
  }
}


class DestinationFailure extends DestinationState {
  final String errorMessage;
  DestinationFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static DestinationFailure fromJson(Map<String, dynamic> response) {
    return DestinationFailure(response['err'] ?? 'Unknown error');
  }



}
