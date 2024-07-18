
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_details_state.dart';



abstract class TripDetailsRepo {
  Future<Either<Failure, TripDetailsSuccess>>
  getTripInfo1(int id);
}
