import 'package:bloc/bloc.dart';
import 'package:voyago/feature/images/data/repo/images_repo.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_state.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

class AllImagesCubit extends Cubit<AllImageState> {
  final ImagesRepo imagesRepo;

  AllImagesCubit(this.imagesRepo) : super(AllImageInitial());

  Future<void> fetchTripDetailsInfo1(String url, int id) async {
    emit(AllImageLoading());
    final result = await imagesRepo.getAllImage(url, id);
    result.fold(
          (failure) {
        emit(AllImageFailure(failure.errMessage));
      },
          (success) {
        emit(AllImageSuccess(success.images));
      },
    );
  }
}