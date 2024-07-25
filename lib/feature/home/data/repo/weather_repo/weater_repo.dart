
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';


abstract class WeatherRepo {
  Future<Either<Failure, WeatherSuccess>>
  getWeatherInfo(double lat, double long);

}
