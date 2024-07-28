

import 'package:bloc/bloc.dart';

import '../../../../destination/data/repo/destination_repo.dart';
import 'destination_state.dart';


class DestinationCubit extends Cubit<DestinationState> {
  final DestinationRepo destinationRepo;

  DestinationCubit( this.destinationRepo) : super(DestinationInitial());

  Future<void> fetchDestinationInitial(String url) async {
    emit(DestinationLoading());

    var result = await destinationRepo.getDestination(url);
    result.fold(
          (failure)
          {
            emit(DestinationFailure(failure.errMessage));
            // emit(DestinationInitial());
            },
          (success) async {

        emit(DestinationSuccess(success.destinationModels));

      },
    );
  }


}
