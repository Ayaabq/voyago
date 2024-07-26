import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_state.dart';

import '../../../../../core/domain/services/api.dart';
import '../../../presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';

class TripDetailsRepoImp implements TripDetailsRepo {
  final ApiServices api;

  TripDetailsRepoImp(this.api);
  @override
  Future<Either<Failure, TripInfo1Success>> getTripInfo1(
      int id) async {

    try {
      var response = await api.get(Confg.tripInfo1+id.toString(), hasToken: true);
      print(response);
      return right(TripInfo1Success.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }




  @override
  Future<Either<Failure, TripInfo2Success>> getTripInfo2(
      int id) async {

    try {
      var response = await api.get(Confg.tripInfo2+id.toString(), hasToken: true);
      print(response);
      return right(TripInfo2Success.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TripInfo3PlacesSuccess>> getTripInfo3(int id) async {

    try {
      var response = await api.get(Confg.tripInfo3+id.toString(), hasToken: true);
      print(response);
      return right(TripInfo3PlacesSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ItinerarySuccess>> itinerary(int id) async{
    try {
      var response = await api.get(Confg.itinerary+id.toString(), hasToken: true);
      print(response);
      return right(ItinerarySuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

}
