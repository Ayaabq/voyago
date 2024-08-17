


import 'package:equatable/equatable.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

abstract class AttractionState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AttractionInitial extends AttractionState {}

class AttractionLoading extends AttractionState {}

class AttractionSuccess extends AttractionState {
  final List<AttractionModel> attractionModel;

  AttractionSuccess(this.attractionModel);
  @override
  List<Object?> get props => [attractionModel];
  static AttractionSuccess fromJson(Map<String, dynamic> response, bool inData) {
    final destinations;
    if(inData)
      destinations = (response['data']as List)
          .map((e) => AttractionModel.fromJson(e))
          .toList();
    else
      destinations = (response['data']['attractions'] as List)
          .map((e) => AttractionModel.fromJson(e))
          .toList();
    return AttractionSuccess(destinations);
  }
  static AttractionSuccess fromSearchJson(Map<String, dynamic> response, bool inData) {
    final destinations;
    if(inData)
     destinations = (response['data']as List)
        .map((e) => AttractionModel.fromJson(e))
        .toList();
    else
     destinations = (response['data']['attractions'] as List)
        .map((e) => AttractionModel.fromJson(e))
        .toList();
    return AttractionSuccess(destinations);
  }
}


class AttractionFailure extends AttractionState {
  final String errorMessage;
  AttractionFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static AttractionFailure fromJson(Map<String, dynamic> response) {
    return AttractionFailure(response['err'] ?? 'Unknown error');
  }



}
