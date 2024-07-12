
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';

import '../../presentation/manager/change_favorite_cubit/favorite_destination_state.dart';



abstract class FavoriteRepo {
  Future<Either<Failure, ChangeFavouriteSuccess>>
  addID2Favourite(int id, String url);
}
