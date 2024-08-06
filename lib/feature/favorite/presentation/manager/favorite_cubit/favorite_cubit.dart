

import 'package:bloc/bloc.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo.dart';
import 'package:voyago/feature/notification/data/repo/notification_repo.dart';

import '../../../../destination/data/repo/destination_repo.dart';
import 'favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit( this.favoriteRepo) : super(FavoriteInitial());

  Future<void> fetchFavorite() async {
    emit(FavoriteLoading());

    var result = await favoriteRepo.getFavourite();
    result.fold(
          (failure)
          {
            emit(FavoriteFailure(failure.errMessage));
            },
          (success) async {

        emit(FavoriteSuccess(success.destinations,success.attractions,success.trips));

      },
    );
  }


}
