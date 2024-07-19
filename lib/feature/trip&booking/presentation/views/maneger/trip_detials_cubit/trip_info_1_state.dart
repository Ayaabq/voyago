
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';


abstract class TripInfo1State {}

class TripInfo1Initial extends TripInfo1State {}

class TripInfo1Loading extends TripInfo1State {}

class TripInfo1Success extends TripInfo1State {
  final TripInfo1Model tripInfo1Model;

  TripInfo1Success(this.tripInfo1Model);

  static TripInfo1Success fromJson(Map<String, dynamic> response) {
    final tripInfo1 = TripInfo1Model.fromJson(response['data']);
    return TripInfo1Success(tripInfo1);
  }
}


class TripInfo1Failure extends TripInfo1State {
  final String errorMessage;
  TripInfo1Failure(this.errorMessage);

  static TripInfo1Failure fromJson(Map<String, dynamic> response) {
    return TripInfo1Failure(response['err'] ?? 'Unknown error');
  }



}