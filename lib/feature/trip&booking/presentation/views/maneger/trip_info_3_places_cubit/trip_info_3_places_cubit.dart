import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_state.dart';

class TripInfo3PlacesCubit extends Cubit<TripInfo3PlacesState> {
  final TripDetailsRepo tripDetailsRepo;

  TripInfo3PlacesCubit(this.tripDetailsRepo) : super(TripInfo3PlacesInitial());

  Future<void> fetchTripDetailsInfo3(int id) async {
    emit(TripInfo3PlacesLoading());
    final result = await tripDetailsRepo.getTripInfo3(id);
    result.fold(
          (failure) {
        emit(TripInfo3PlacesFailure(failure.errMessage));
      },
          (success) {
        emit(TripInfo3PlacesSuccess(success.tripInfo3Model));
      },
    );
  }
}