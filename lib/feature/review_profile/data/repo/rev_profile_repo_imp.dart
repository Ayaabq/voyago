import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/domain/services/api.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/confg.dart';
import '../../presention/manger/cubit/profile_reviews_cubit_state.dart';
import 'rev_profile_repo.dart';

class ReviewsProfRepoImp implements ReviewsProfileRepo {
  final ApiServices api;

  ReviewsProfRepoImp(this.api);

@override
  Future<Either<Failure, ReviewsProfSuccess>>getReviewsProfile()async {
    try {
      var response = await api.get( Confg.revivesProfile,
          hasToken: true);
      return right(ReviewsProfSuccess.fromJson(
          response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
