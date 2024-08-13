// location_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../../data/repo/location_repo.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepository;
  static double? userLat;
  static double? userLong;
  static double? placeLat;
  static double? placeLong;
  LocationCubit(this.locationRepository) : super(LocationInitial());

  Future<void> fetchUserLocation() async {
    try {
      emit(LocationLoading());
      final locationData = await locationRepository.getUserLocation();
      userLat = locationData.longitude;
      userLong = locationData.longitude;
      emit(LocationLoaded(locationData));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<LocationData?> fetchPlaceLocation(String place) async {
    emit(LocationLoading());
    var res = await locationRepository.getPlaceLocation(place);
    res.fold((failuer) {
      emit(LocationError(failuer.errMessage));
    }, (sucses) {
      print("yeeeeeees");
      placeLat=sucses.latitude;
      placeLong=sucses.longitude;
      emit(LocationLoaded(sucses));

      return sucses;
    });
    return null;
  }
}
