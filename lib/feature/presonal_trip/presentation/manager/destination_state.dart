

import 'package:equatable/equatable.dart';

import '../../data/prev_model.dart';

abstract class PrevState extends Equatable{

  @override
  List<Object?> get props => [];
}

class PrevInitial extends PrevState {}

class PrevLoading extends PrevState {}

class PrevSuccess extends PrevState {
  final List<PrevTrip> destinationModels;

  PrevSuccess(this.destinationModels);
  @override
  List<Object?> get props => [destinationModels];
  static PrevSuccess fromJson(Map<String, dynamic> response) {
    final destinations;
     destinations = (response['data']['personal_trip']as List)
        .map((e) => PrevTrip.fromJson(e))
        .toList();


    return PrevSuccess(destinations);
  }
}


class PrevFailure extends PrevState {
  final String errorMessage;
  PrevFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static PrevFailure fromJson(Map<String, dynamic> response) {
    return PrevFailure(response['err'] ?? 'Unknown error');
  }



}
