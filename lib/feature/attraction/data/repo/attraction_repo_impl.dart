import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';

import '../../../../core/domain/services/api.dart';
import '../../../../core/utils/confg.dart';


class AttractionRepoImp implements AttractionRepo {
  bool isMatchingUrl(String url) {
    // Define the regular expression pattern
    final pattern = RegExp(r'^/attractionsByDestenations/\d+$');

    // Check if the URL matches the pattern
    return pattern.hasMatch(url);
  }
  final ApiServices api;

  AttractionRepoImp(this.api);
  @override
  Future<Either<Failure, AttractionSuccess>> getAttraction(
      String url) async {

    try {
      var response = await api.get(url, hasToken: true);
      bool inData=isMatchingUrl(url);
      return right(AttractionSuccess.fromJson(response,inData ));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttractionSuccess>> getSearchAttraction(String destination) async{
    try {
      var response = await api.get(Confg.attractionSearch+destination, hasToken: true);
      bool inData= false;
      return right(AttractionSuccess.fromSearchJson(response,inData));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
