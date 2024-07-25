import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weater_repo.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';

import '../../../../../core/domain/services/api.dart';
import '../../../../../core/utils/confg.dart';

class WeatherRepoImpl implements WeatherRepo {
  final ApiServices api;

  WeatherRepoImpl( this.api);

  @override
  Future<Either<Failure, WeatherSuccess>> getWeatherInfo  (double lat, double long) async{
    final url=Confg.getWeatherUrl(lat, long);
    try {
      var response = await api.get(url);
      print(response);
      return right(WeatherSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}