import 'package:bloc/bloc.dart';
import 'package:voyago/feature/place/presentaion/manager/place_info_section_cubit/place_info_section_state.dart';

import '../../../data/repo/palce_repo_impl.dart';

class PlaceInfoCubit extends Cubit<PlaceInfoSectionState> {
  final PlaceRepo placeRepo;

  PlaceInfoCubit(this.placeRepo) : super(PlaceInfoSectionInitial());

  Future<void> fetchTripDetailsInfo1(String url) async {
    emit(PlaceInfoSectionLoading());
    final result = await placeRepo.getPlaceInfo(url);
    result.fold(
          (failure) {
        emit(PlaceInfoSectionFailure(failure.errMessage));
      },
          (success) {
        emit(PlaceInfoSectionSuccess(success.placeModel));
      },
    );
  }
}