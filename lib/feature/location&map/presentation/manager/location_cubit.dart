// location_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/location_repo.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepository;

  LocationCubit(this.locationRepository) : super(LocationInitial());

  Future<void> fetchLocation() async {
    try {
      emit(LocationLoading());
      final locationData = await locationRepository.getCurrentLocation();
      emit(LocationLoaded(locationData));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
