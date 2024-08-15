import 'package:bloc/bloc.dart';
import 'package:voyago/feature/search/data/repo/search_repo.dart';
import 'package:voyago/feature/search/presentation/manager/filters_state.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_state.dart';
import 'package:voyago/feature/search/presentation/views/trip_searc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trips_repo/trips_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';

class TripSearchCubit extends Cubit<TripsSearchState> {
  final SearchRepo searchRepo;

  TripSearchCubit(this.searchRepo) : super(TripsSearchInitial());

  Future<void> fetchTripsInitial(String? destination, FilterState? filter) async {
    emit(TripsSearchLoading());
    final result = await searchRepo.getSearchTrips(destination,filter);
    result.fold(
          (failure) {
        emit(TripsSearchFailure(failure.errMessage));
      },
          (success) {
        emit(TripsSearchSuccess(success.tripModels));
      },
    );
  }
}

