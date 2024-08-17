import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/feature/presonal_trip/data/personal_trip_model.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/destination_state.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/personal_trip_view.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/confg.dart';
import '../../../../core/utils/services_locater.dart';

class PersonatlTripRepo{
  ApiServices api=getIt.get<ApiServices>();
  Future<Either<Failure, String>>
  submitCheckout(PersonalTripModel trip) async {
    try {
      print(trip.toJson());
      final response = await api.post(
        Confg.addPersonalTrip,

        body: (trip.toJson()),
      );


      if(response['msg']=='fail') {
        print("object");
        return left(ServiecesFailure(response['err']));
      }
      return right("Done");
    }
    catch (e) {

      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  Future<Either<Failure, PrevSuccess>> getPrev(
      String url) async {
    final url=Confg.allPrev;
    try {
      var response = await api.get( url,hasToken: true);

      return right(PrevSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  Future<Either<Failure, PrevSuccess>> getPrevOvreView(
      String url) async {
    final url=Confg.prevInfo3;
    try {
      var response = await api.get( url,hasToken: true);

      return right(PrevSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

}