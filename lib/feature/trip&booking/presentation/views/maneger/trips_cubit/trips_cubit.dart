// import 'package:bloc/bloc.dart';
// import 'package:voyago/feature/trip&booking/data/repo/trips_repo.dart';
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
import 'package:voyago/feature/trip&booking/data/repo/trips_repo/trips_repo.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  final TripsRepo tripsRepo;

  TripsCubit(this.tripsRepo) : super(TripsInitial());

  Future<void> fetchTripsInitial(String url) async {
    emit(TripsLoading());
    final result = await tripsRepo.getTrips(url);
    result.fold(
          (failure) {
        emit(TripsFailure(failure.errMessage));
      },
          (success) {
        emit(TripsSuccess(success.tripModels));
      },
    );
  }
}

