
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';


abstract class TripDetailsState {}

class TripDetailsInitial extends TripDetailsState {}

class TripDetailsLoading extends TripDetailsState {}

class TripDetailsSuccess extends TripDetailsState {
  final TripInfo1Model tripInfo1Model;

  TripDetailsSuccess(this.tripInfo1Model);

  static TripDetailsSuccess fromJson(Map<String, dynamic> response) {
    final tripInfo1 = TripInfo1Model.fromJson(response['data']);
    return TripDetailsSuccess(tripInfo1);
  }
}


class TripDetailsFailure extends TripDetailsState {
  final String errorMessage;
  TripDetailsFailure(this.errorMessage);

  static TripDetailsFailure fromJson(Map<String, dynamic> response) {
    return TripDetailsFailure(response['err'] ?? 'Unknown error');
  }



}