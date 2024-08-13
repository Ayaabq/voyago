import 'package:bloc/bloc.dart';
import 'package:voyago/feature/images/data/repo/images_repo.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImagesRepo imagesRepo;

  ImageCubit(this.imagesRepo) : super(ImageInitial());

  Future<void> fetchTripDetailsInfo1(String url, int id) async {
    emit(ImageLoading());
    final result = await imagesRepo.getImage(url, id);
    result.fold(
          (failure) {
        emit(ImageFailure(failure.errMessage));
      },
          (success) {
        emit(ImageSuccess(success.image));
      },
    );
  }
}