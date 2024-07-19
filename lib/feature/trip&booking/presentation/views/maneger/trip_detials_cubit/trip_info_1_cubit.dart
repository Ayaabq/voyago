import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_state.dart';

class TripDetailsCubit extends Cubit<TripInfo1State> {
  final TripDetailsRepo tripDetailsRepo;

  TripDetailsCubit(this.tripDetailsRepo) : super(TripInfo1Initial());

  Future<void> fetchTripDetailsInfo1(int id) async {
    emit(TripInfo1Loading());
    final result = await tripDetailsRepo.getTripInfo1(id);
    result.fold(
          (failure) {
        emit(TripInfo1Failure(failure.errMessage));
      },
          (success) {
        emit(TripInfo1Success(success.tripInfo1Model));
      },
    );
  }
}