// location_state.dart
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData locationData;

  const LocationLoaded(this.locationData);

  @override
  List<Object> get props => [locationData];
}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
