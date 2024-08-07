import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_state.dart';

import '../../../../core/domain/services/api.dart';
import '../models/review_model.dart';

class ReviewRepoImp implements ReviewRepo {
  final ApiServices api;

  ReviewRepoImp(this.api);
  @override
  Future<Either<Failure, ReviewsSuccess>> getReviews(String url) async {
    try {
      var response = await api.get(url, hasToken: true);
      return right(ReviewsSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SingleReviewSuccess>> postReview(
      String url, ReviewModel review) async {
    try {
      var response = await api.post(url, hasToken: true, body: review.toJson());
      return right(SingleReviewSuccess());
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
