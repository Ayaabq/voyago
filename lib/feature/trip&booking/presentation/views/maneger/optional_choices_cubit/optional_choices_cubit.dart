// import 'package:bloc/bloc.dart';
// import 'package:voyago/feature/trip&booking/data/weather_repo/trips_repo.dart';
// import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';
//
//
//
// class TripsCubit extends Cubit<TripsState> {
//   final TripsRepo tripsRepo;
//
//   TripsCubit( this.tripsRepo) : super(TripsInitial());
//
//   Future<void> fetchDestinationInitial(String url) async {
//     emit(TripsLoading());
//
//     var result = await tripsRepo.getTrips(url);
//     print(result);
//     result.fold(
//           (failure)
//       {
//         emit(TripsFailure(failure.errMessage));
//         // emit(DestinationInitial());
//       },
//           (success) async {
//
//         emit(TripsSuccess(success.tripModels));
//
//       },
//     );
//   }
//
//
// }
import 'package:bloc/bloc.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo.dart';

import 'optional_choices_state.dart';

class OptionalEventsCubit extends Cubit<OptionalEventState> {
  final TripDetailsRepo tripsRepo;

  OptionalEventsCubit(this.tripsRepo) : super(OptionalEventInitial());

  Future<void> fetchEventsInitial(int id) async {
    emit(OptionalEventLoading());
    final result = await tripsRepo.getOptionalEvent(id);
    result.fold(
          (failure) {
        emit(OptionalEventFailure(failure.errMessage));
      },
          (success) {
        emit(OptionalEventSuccess(success.events));
      },
    );
  }
}

