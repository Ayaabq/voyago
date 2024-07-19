
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';

import '../../../../data/models/trip_info_2_model.dart';


abstract class TripInfo2State {}

class TripInfo2Initial extends TripInfo2State {}

class TripInfo2Loading extends TripInfo2State {}

class TripInfo2Success extends TripInfo2State {
  final TripInfo2Model tripInfo2Model;

  TripInfo2Success(this.tripInfo2Model);

  static TripInfo2Success fromJson(Map<String, dynamic> response) {
    final tripInfo2 = TripInfo2Model.fromJson(response['data']);
    return TripInfo2Success(tripInfo2);
  }
}


class TripInfo2Failure extends TripInfo2State {
  final String errorMessage;
  TripInfo2Failure(this.errorMessage);

  static TripInfo2Failure fromJson(Map<String, dynamic> response) {
    return TripInfo2Failure(response['err'] ?? 'Unknown error');
  }



}