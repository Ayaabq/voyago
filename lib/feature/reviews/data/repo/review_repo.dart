
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';




abstract class ReviewRepo {
  Future<Either<Failure, ReviewsSuccess>>
  getReviews(String url);
}
