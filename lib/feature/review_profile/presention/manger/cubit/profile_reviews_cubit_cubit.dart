import 'package:bloc/bloc.dart';

import '../../../data/repo/rev_profile_repo.dart';
import 'profile_reviews_cubit_state.dart';

class ReviewsProfCubit extends Cubit<ReviewsProfState> {
  final ReviewsProfileRepo reviewsRepo;

  ReviewsProfCubit(this.reviewsRepo) : super(ReviewsProfInitial());

  Future<void> fetchReviewsProf() async {
    emit(ReviewsProfLoading());

    var result = await reviewsRepo.getReviewsProfile();
    result.fold(
      (failure) {
        emit(ReviewsProfFailure(failure.errMessage));
      },
      (success) async {
        emit(ReviewsProfSuccess(
            success.destinations, success.attractions, success.trips));
      },
    );
  }
}
