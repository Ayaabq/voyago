// location_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/location_repo.dart';
import 'location_state.dart';

class AddressCubit extends Cubit<String> {
  final LocationRepo locationRepository;
  AddressCubit(this.locationRepository) : super("no address yet");

  Future<void> fetchLocation(double lat, double long) async {

      emit("loading");
      final result = await locationRepository.getAddress(lat, long);
      result.fold(
              (failure){
                emit(failure.errMessage);
              }
          , (success){
                emit(success);
      }
      );

  }
}
