import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/data/repo/trips_repo/trips_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_details_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';

import '../../../../../core/domain/services/api.dart';

class TripDetailsRepoImp implements TripDetailsRepo {
  final ApiServices api;

  TripDetailsRepoImp(this.api);
  @override
  Future<Either<Failure, TripDetailsSuccess>> getTripInfo1(
      int id) async {

    try {
      var response = await api.get(Confg.tripInfo1+id.toString(), hasToken: true);
      print(response);
      return right(TripDetailsSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
