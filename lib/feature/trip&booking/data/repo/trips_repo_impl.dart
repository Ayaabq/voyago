import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/trip&booking/data/repo/trips_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';

import '../../../../core/domain/services/api.dart';

class TripsRepoImp implements TripsRepo {
  final ApiServices api;

  TripsRepoImp(this.api);
  @override
  Future<Either<Failure, TripsSuccess>> getTrips(
      String url) async {

    try {
      var response = await api.get(url, hasToken: true);
      print(response);
      return right(TripsSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
