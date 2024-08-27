import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/feature/presonal_trip/data/personal_trip_model.dart';
import 'package:voyago/feature/presonal_trip/data/prev_overview_model.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/destination_state.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/personal_trip_view.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/confg.dart';
import '../../../../core/utils/services_locater.dart';
import '../action.dart';

class PersonatlTripRepo {
  ApiServices api = getIt.get<ApiServices>();
  Future<Either<Failure, String>> submitCheckout(PersonalTripModel trip) async {
    try {
      print(trip.toJson());
      final response = await api.post(
        Confg.addPersonalTrip,
        body: (trip.toJson()),
      );

      if (response['msg'] == 'fail') {
        print("object");
        return left(ServiecesFailure(response['err']));
      }
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  Future<Either<Failure, PrevSuccess>> getPrev(String url) async {
    final url = Confg.allPrev;
    try {
      var response = await api.get(url, hasToken: true);

      return right(PrevSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  Future<Either<Failure, PrevOverview>> getPrevOvreView(int id) async {
    final url = Confg.prevInfo3+ id.toString();
    try {
      var response = await api.get(url, hasToken: true);

      return right(PrevOverview.fromJson(response["data"]["trip"]));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  Future< String> addEvent(int id,Activity a) async {
    final url = Confg.addPrevEvent ;
    try {
      var response = await api.post(url, hasToken: true,
          body: a.toJson()
      );

      return response['msg'];
    } catch (e) {
      // if (e is DioException) {
        return e.toString();

  }
}
}
