


import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

abstract class AttractionState {}

class AttractionInitial extends AttractionState {}

class AttractionLoading extends AttractionState {}

class AttractionSuccess extends AttractionState {
  final List<AttractionModel> attractionModel;

  AttractionSuccess(this.attractionModel);

  static AttractionSuccess fromJson(Map<String, dynamic> response) {
    final destinations = (response['data']['result'] as List)
        .map((e) => AttractionModel.fromJson(e))
        .toList();
    return AttractionSuccess(destinations);
  }
}


class AttractionFailure extends AttractionState {
  final String errorMessage;
  AttractionFailure(this.errorMessage);

  static AttractionFailure fromJson(Map<String, dynamic> response) {
    return AttractionFailure(response['err'] ?? 'Unknown error');
  }



}
