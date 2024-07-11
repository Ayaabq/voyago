import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/destination_model.dart';
import '../../../data/repo/core_repo.dart';
import 'favorite_destination_state.dart';

class ChangeFavoriteDestinationCubit extends Cubit<ChangeDestinationFavoriteState> {
  final CoreRepo coreRepo;
  bool hasShownFailureToast = false;

  ChangeFavoriteDestinationCubit(this.coreRepo) : super(ChangeDestinationFavoriteInitial());

  Future<void> addTrendingDestination2Favourite(DestinationModel destinationModel) async {
    emit(ChangeDestinationFavoriteLoading());

    var result = await coreRepo.addDestination2Favourite(destinationModel);
    print(result);
    result.fold(
          (failure) {
        emit(ChangeDestinationFavouriteFailure(errorMessage: failure.errMessage));
      },
          (success) async {
        emit(ChangeDestinationFavouriteSuccess(destinationModel, message: success.message));
        hasShownFailureToast = false;  // Reset the flag on success
      },
    );
  }

  void resetFailureToastFlag() {
    hasShownFailureToast = false;
  }
}
