
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';



abstract class TripsRepo {
  Future<Either<Failure, TripsSuccess>>
  getTrips(String url, bool inData);
}
