import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/domain/services/api_imp.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo_impl.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo_impl.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo_imp.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo_impl.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weather_repo_impl.dart';
import 'package:voyago/feature/place/data/repo/place_reop.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo_impl.dart';

import '../../feature/destination/data/repo/destination_repo_impl.dart';
import '../../feature/trip&booking/data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../../feature/trip&booking/data/repo/trips_repo/trips_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocater() {
  getIt.registerSingleton<ApiServices>(ApiServicesImp(Dio()));
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<DestinationRepoImp>(DestinationRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<FavoriteRepoImp>(FavoriteRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<AttractionRepoImp>(AttractionRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<TripsRepoImp>(TripsRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<TripDetailsRepoImp>(TripDetailsRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<PlaceRepoImp>(PlaceRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<ReviewRepoImp>(ReviewRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<WeatherRepoImpl>(WeatherRepoImpl(getIt.get<ApiServices>()));
}
