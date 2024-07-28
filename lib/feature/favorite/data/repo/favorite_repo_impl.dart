import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo.dart';

import '../../../../core/domain/services/api.dart';
import '../../presentation/manager/change_favorite_cubit/favorite_state.dart';


class FavoriteRepoImp implements FavoriteRepo {
  final ApiServices api;

  FavoriteRepoImp(this.api);

  @override
  Future<Either<Failure, ChangeFavouriteSuccess>>
  addID2Favourite(int id, String url) async {
    try {
      var response = await api.put(
          url + id.toString(),
          hasToken: true);
      return right(ChangeFavouriteSuccess.fromJson(
          response, id));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
