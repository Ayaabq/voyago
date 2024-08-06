
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/favorite/presentation/manager/favorite_cubit/favorite_state.dart';

import '../../presentation/manager/change_favorite_cubit/favorite_state.dart';



abstract class FavoriteRepo {
  Future<Either<Failure, ChangeFavouriteSuccess>>
  addID2Favourite(int id, String url);
  Future<Either<Failure, FavoriteSuccess>>
  getFavourite();
}
