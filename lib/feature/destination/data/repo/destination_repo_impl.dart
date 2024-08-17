import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';

import '../../../../core/domain/services/api.dart';
import '../../presentation/manager/destination_cubit/destination_state.dart';

import 'destination_repo.dart';

class DestinationRepoImp implements DestinationRepo {
  final ApiServices api;

  DestinationRepoImp(this.api);
  @override
  Future<Either<Failure, DestinationSuccess>> getDestination(
      String url) async {

    try {
      var response = await api.get(url, hasToken: true);
      bool in_data= url==Confg.allDestination;
      return right(DestinationSuccess.fromJson(response, in_data));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
