import 'package:bloc/bloc.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_state.dart';



class SingleReviewCubit extends Cubit<SingleReviewState> {
  final ReviewRepo reviewsRepo;

  SingleReviewCubit(this.reviewsRepo) : super(SingleReviewInitial());

  Future<void> postReview(String url, ReviewModel review) async {
    emit(SingleReviewLoading());

    var result = await reviewsRepo.postReview(url, review);

    result.fold(
          (failure) {

        emit(SingleReviewFailure(failure.errMessage));
      },
          (success) async {
        emit(SingleReviewSuccess());

      },
    );
  }
}
