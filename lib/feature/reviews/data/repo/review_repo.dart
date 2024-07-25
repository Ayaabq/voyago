import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_state.dart';

abstract class ReviewRepo {
  Future<Either<Failure, ReviewsSuccess>> getReviews(String url);
  Future<Either<Failure, SingleReviewSuccess>> postReview(
     String url, ReviewModel review);
}
