import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../presention/manger/cubit/profile_reviews_cubit_state.dart';

abstract class ReviewsProfileRepo {
  
  Future<Either<Failure, ReviewsProfSuccess>>
  getReviewsProfile();
}
