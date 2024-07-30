import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weater_repo.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';
import 'package:voyago/feature/profile/data/repo/settings_repo.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_state.dart';

import '../../../../../core/domain/services/api.dart';
import '../../../../../core/utils/confg.dart';

class CurrencyRepoImpl implements CurrencyRepo {
  final ApiServices api;

  CurrencyRepoImpl(this.api);

  @override
  Future<Either<Failure, WeatherSuccess>> getWeatherInfo(
      double lat, double long) async {
    final url = Confg.getWeatherUrl(lat, long);
    try {
      var response = await api.get(url);
      return right(WeatherSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CurrencySuccess>> get currency async {
    const url = Confg.getAllCurrency;
    try {
      var response = await api.get(url);
      return right(CurrencySuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
