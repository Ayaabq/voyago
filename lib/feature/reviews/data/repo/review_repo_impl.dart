import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';

import '../../../../core/domain/services/api.dart';


class ReviewRepoImp implements ReviewRepo {
  final ApiServices api;

  ReviewRepoImp(this.api);
  @override
  Future<Either<Failure, ReviewsSuccess>> getReviews(
      String url) async {

    try {
      var response = await api.get(url, hasToken: true);
      print(response);
      return right(ReviewsSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
