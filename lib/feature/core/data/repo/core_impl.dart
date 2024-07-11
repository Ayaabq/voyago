import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/data/enums/destination_enum.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/core/data/models/destination_model.dart';

import 'package:voyago/feature/core/presentation/manager/destination_cubit/destination_state.dart';
import 'package:voyago/feature/core/presentation/manager/favotire_destination_cubit/favorite_destination_state.dart';

import '../../../../core/domain/services/api.dart';
import 'core_repo.dart';

class CoreRepoImp implements CoreRepo {
  final ApiServices api;

  CoreRepoImp(this.api);
  @override
  Future<Either<Failure, DestinationSuccess>> getDestination(
      DestinationListType type) async {
    Map<DestinationListType, String> url = {
      DestinationListType.trending: Confg.trendingDestinationsUrl,
      // TODO: Add the other urls before complete connecting
    };
    try {
      var response = await api.get(url[type]!, hasToken: true);
      print(response);
      return right(DestinationSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangeDestinationFavouriteSuccess>>
      addDestination2Favourite(DestinationModel destinationModel) async {
    print("yeees");
    try {
      var response = await api.put(
          Confg.addDestenationDavouriteUrl +
              destinationModel.id.toString(),
          hasToken: true);
      print(response);
      return right(ChangeDestinationFavouriteSuccess.fromJson(
          response, destinationModel));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
