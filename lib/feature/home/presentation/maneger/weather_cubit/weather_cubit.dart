import 'package:bloc/bloc.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weater_repo.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../../location&map/data/repo/location_repo.dart';
import '../../../../location&map/presentation/manager/location_cubit.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo placeRepo;

  WeatherCubit(this.placeRepo) : super(WeatherInitial());

  Future<void> fetchWeather(double lat, double long) async {

    emit(WeatherLoading());
    final result = await placeRepo.getWeatherInfo(lat, long);
    result.fold(
          (failure) {
        emit(WeatherFailure(failure.errMessage));
      },
          (success) {
        emit(WeatherSuccess(success.weatherModel));
      },
    );
  }
}