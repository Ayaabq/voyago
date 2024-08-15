import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:location/location.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/domain/services/api_imp.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/location&map/presentation/manager/location_cubit.dart';

import '../../../../core/errors/failure.dart';
import 'location_repo.dart';

class LocationRepositoryImpl implements LocationRepo {
  final Location location;

  LocationRepositoryImpl(this.location);

  @override
  Future<LocationData> getUserLocation() async {
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

  @override
  Future<Either<Failure,String>> getAddress(double lat, double long) async{
    final api=getIt.get<ApiServices>();
    try {
      var response = await api.get(
        // "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyBfSxmU81EloKcv7r3ET_69ciGIPlup9Dw"
        Confg.getAddressFromLatLong(lat, long)
      );
      final String formattedAddress = response['results'][0]['formatted_address'];

      return Right(formattedAddress);
        //response["results"]["formatted_address"];
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServiecesFailure.fromDioError(e));
      // }
      return left(ServiecesFailure("no Address for this area"));
    }
  }

  @override
  Future<Either<Failure,LocationData>> getPlaceLocation( String place) async{
    final api=getIt.get<ApiServices>();

   try {
      var response = await api.get(
          // "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyBfSxmU81EloKcv7r3ET_69ciGIPlup9Dw"
          Confg.getLatLongApi(place));
      print(response.toString());
      final double lat = response['results'][0]['geometry']['location']['lat'];
      final double lng = response['results'][0]['geometry']['location']['lng'];

      LocationData l = LocationData.fromMap({
        'latitude': lat,
        'longitude': lng,
      });
      return right(l);
    }catch  (e){
     return left(ServiecesFailure(e.toString()));
   }
  }

}