import 'package:location/location.dart';

abstract class LocationRepo {
  Future<LocationData> getCurrentLocation();
}