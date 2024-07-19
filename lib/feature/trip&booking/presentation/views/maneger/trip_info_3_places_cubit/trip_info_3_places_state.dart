
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_3_places_model.dart';

import '../../../../data/models/trip_info_2_model.dart';


abstract class TripInfo3PlacesState {}

class TripInfo3PlacesInitial extends TripInfo3PlacesState {}

class TripInfo3PlacesLoading extends TripInfo3PlacesState {}

class TripInfo3PlacesSuccess extends TripInfo3PlacesState {
  final TripInfo3PlacesModel tripInfo3Model;

  TripInfo3PlacesSuccess(this.tripInfo3Model);

  static TripInfo3PlacesSuccess fromJson(Map<String, dynamic> response) {
    final tripInfo3 = TripInfo3PlacesModel.fromJson(response['data']);
    return TripInfo3PlacesSuccess(tripInfo3);
  }
}


class TripInfo3PlacesFailure extends TripInfo3PlacesState {
  final String errorMessage;
  TripInfo3PlacesFailure(this.errorMessage);

  static TripInfo3PlacesFailure fromJson(Map<String, dynamic> response) {
    return TripInfo3PlacesFailure(response['err'] ?? 'Unknown error');
  }



}