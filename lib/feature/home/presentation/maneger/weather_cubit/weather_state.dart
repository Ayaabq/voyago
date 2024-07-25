
import 'package:voyago/feature/home/data/models/weather_model.dart';



abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess(this.weatherModel);

  static WeatherSuccess fromJson(Map<String, dynamic> response) {
    final placeModel = WeatherModel.fromJson(response);
    return WeatherSuccess(placeModel);
  }
}


class WeatherFailure extends WeatherState {
  final String errorMessage;
  WeatherFailure(this.errorMessage);

  static WeatherFailure fromJson(Map<String, dynamic> response) {
    return WeatherFailure(response['err'] ?? 'Unknown error');
  }



}