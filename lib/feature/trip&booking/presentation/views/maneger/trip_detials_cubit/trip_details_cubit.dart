import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final TripDetailsRepo tripDetailsRepo;

  TripDetailsCubit(this.tripDetailsRepo) : super(TripDetailsInitial());

  Future<void> fetchTripDetailsInfo1(int id) async {
    emit(TripDetailsLoading());
    final result = await tripDetailsRepo.getTripInfo1(id);
    result.fold(
          (failure) {
        emit(TripDetailsFailure(failure.errMessage));
      },
          (success) {
        emit(TripDetailsSuccess(success.tripInfo1Model));
      },
    );
  }
}