import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_state.dart';

class ItineraryCubit extends Cubit<ItineraryState> {
  final TripDetailsRepo tripDetailsRepo;

  ItineraryCubit(this.tripDetailsRepo) : super(ItineraryInitial());

  Future<void> fetchTripsInitial(int id, String? url) async {
    emit(ItineraryLoading());
    final result = await tripDetailsRepo.itinerary(id,url);
    result.fold(
          (failure) {
        emit(ItineraryFailure(failure.errMessage));
      },
          (success) {
        emit(ItinerarySuccess(success.itineraryDays));
      },
    );
  }
}

