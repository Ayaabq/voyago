import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/place/data/repo/palce_repo_impl.dart';
import 'package:voyago/feature/place/presentaion/manager/place_info_section_cubit/place_info_section_state.dart';

import '../../../../core/domain/services/api.dart';

class PlaceRepoImp implements PlaceRepo {
  final ApiServices api;

  PlaceRepoImp(this.api);


  @override
  Future<Either<Failure, PlaceInfoSectionSuccess>> getPlaceInfo(String url) async{

    try {
      var response = await api.get(url, hasToken: true);
      print(response);
      return right(PlaceInfoSectionSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

}
