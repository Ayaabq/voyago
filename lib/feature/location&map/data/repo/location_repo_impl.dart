import 'package:location/location.dart';

import 'location_repo.dart';

class LocationRepositoryImpl implements LocationRepo {
  final Location location;

  LocationRepositoryImpl(this.location);

  @override
  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception("Location permissions are denied.");
      }
    }

    return await location.getLocation();
  }
}