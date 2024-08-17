

import 'package:bloc/bloc.dart';

import '../../data/repo/personatl_trip_repo.dart';
import 'destination_state.dart';


class PrevCubit extends Cubit<PrevState> {
  final PersonatlTripRepo destinationRepo;

  PrevCubit( this.destinationRepo) : super(PrevInitial());

  Future<void> fetchDestinationInitial(String url) async {
    emit(PrevLoading());

    var result = await destinationRepo.getPrev(url);
    result.fold(
          (failure)
          {
            emit(PrevFailure(failure.errMessage));
            // emit(DestinationInitial());
            },
          (success) async {

        emit(PrevSuccess(success.destinationModels));

      },
    );
  }


}
