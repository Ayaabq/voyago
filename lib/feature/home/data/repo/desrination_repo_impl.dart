import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';

import 'package:voyago/feature/home/presentation/maneger/trending_destination_state.dart';

import '../../../../core/domain/services/api.dart';
import 'destination_repo.dart';


class HomeRepoImp implements HomeRepo{
  final ApiServices api;

  HomeRepoImp(this.api);
  @override
  Future<Either<Failure, TrendingDestinationSuccess>> trendingDestination() async{
    try{
      var response= await api.get(Confg.trendingDestinationsUrl,
      hasToken: true);
      print(response);
      return right(TrendingDestinationSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}