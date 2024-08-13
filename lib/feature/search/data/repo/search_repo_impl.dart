import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';

import '../../../../core/domain/services/api.dart';


class AttractionRepoImp implements AttractionRepo {
  final ApiServices api;

  AttractionRepoImp(this.api);
  @override
  Future<Either<Failure, AttractionSuccess>> getAttraction(
      String url) async {

    try {
      var response = await api.get(url, hasToken: true);
      return right(AttractionSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttractionSuccess>> getSearchAttraction(String destination) {
    // TODO: implement getSearchAttraction
    throw UnimplementedError();
  }


}
