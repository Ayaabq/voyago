import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_2_model.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';

class TripInfo2Cubit extends Cubit<TripInfo2State> {
  final TripDetailsRepo tripDetailsRepo;
   TripInfo2Model? tripInfo2Model;

  TripInfo2Cubit(this.tripDetailsRepo) : super(TripInfo2Initial());

  Future<void> fetchTripDetailsInfo1(int id) async {
    emit(TripInfo2Loading());
    final result = await tripDetailsRepo.getTripInfo2(id);
    result.fold(
          (failure) {
        emit(TripInfo2Failure(failure.errMessage));
      },
          (success) {
            tripInfo2Model=success.tripInfo2Model;
        emit(TripInfo2Success(success.tripInfo2Model));
      },
    );
  }
}