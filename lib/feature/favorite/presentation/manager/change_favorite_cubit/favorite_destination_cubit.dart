import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo.dart';

import '../../../../destination/data/models/destination_model.dart';
import '../../../../destination/data/repo/core_repo.dart';
import 'favorite_destination_state.dart';

class ChangeFavoriteCubit extends Cubit<ChangeFavoriteState> {
  final FavoriteRepo favoriteRepo;
  bool hasShownFailureToast = false;

  ChangeFavoriteCubit(this.favoriteRepo) : super(ChangeFavoriteInitial());

  Future<void> addTrendingDestination2Favourite(int id , String url,
      {DestinationModel? destinationModel, }) async {
    emit(ChangeDestinationFavoriteLoading());

    var result = await favoriteRepo.addID2Favourite(id,url);
    print(result);
    result.fold(
          (failure) {
        emit(ChangeFavouriteFailure(errorMessage: failure.errMessage));
      },
          (success) async {
        emit(ChangeFavouriteSuccess( message: success.message, id: success.id));
        if(destinationModel!=null)destinationModel.changeFavouriteStatus();
        hasShownFailureToast = false;  // Reset the flag on success
      },
    );
  }

  void resetFailureToastFlag() {
    hasShownFailureToast = false;
  }
}
