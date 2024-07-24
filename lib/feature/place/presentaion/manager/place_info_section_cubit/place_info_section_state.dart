
import 'package:voyago/feature/place/data/models/place_model.dart';



abstract class PlaceInfoSectionState {}

class PlaceInfoSectionInitial extends PlaceInfoSectionState {}

class PlaceInfoSectionLoading extends PlaceInfoSectionState {}

class PlaceInfoSectionSuccess extends PlaceInfoSectionState {
  final PlaceModel placeModel;

  PlaceInfoSectionSuccess(this.placeModel);

  static PlaceInfoSectionSuccess fromJson(Map<String, dynamic> response) {
    final placeModel = PlaceModel.fromJson(response['data']);
    return PlaceInfoSectionSuccess(placeModel);
  }
}


class PlaceInfoSectionFailure extends PlaceInfoSectionState {
  final String errorMessage;
  PlaceInfoSectionFailure(this.errorMessage);

  static PlaceInfoSectionFailure fromJson(Map<String, dynamic> response) {
    return PlaceInfoSectionFailure(response['err'] ?? 'Unknown error');
  }



}