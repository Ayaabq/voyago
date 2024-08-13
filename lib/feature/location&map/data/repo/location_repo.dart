import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:voyago/core/errors/failure.dart';

abstract class LocationRepo {
  Future<LocationData> getUserLocation();
  Future<Either<Failure,LocationData>> getPlaceLocation(String place);
  Future<Either<Failure,String>> getAddress(double lat, double long);
}