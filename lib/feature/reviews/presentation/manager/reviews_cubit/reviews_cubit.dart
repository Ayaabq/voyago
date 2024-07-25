import 'package:bloc/bloc.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';



class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewRepo reviewsRepo;

  ReviewsCubit(this.reviewsRepo) : super(ReviewsInitial());

  Future<void> fetchReviewsInitial(String url) async {
    emit(ReviewsLoading());

    var result = await reviewsRepo.getReviews(url);
    print(result);
    result.fold(
      (failure) {
        emit(ReviewsFailure(failure.errMessage));
      },
      (success) async {
        emit(ReviewsSuccess(success.reviewModel, success.total, success.rate));
      },
    );
  }
}
