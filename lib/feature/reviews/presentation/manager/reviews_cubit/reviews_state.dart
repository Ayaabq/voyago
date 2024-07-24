


import 'package:equatable/equatable.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';

abstract class ReviewsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviewModel;
  final int total ;
  ReviewsSuccess(this.reviewModel, this.total);
  @override
  List<Object?> get props => [reviewModel];

  static ReviewsSuccess fromJson(Map<String, dynamic> response) {
    final reviews = (response['data']['reviews'] as List)
        .map((e) => ReviewModel.fromJson(e))
        .toList();
    final int allReviews= response['cnt_reviews'];
    return ReviewsSuccess(reviews,allReviews);
  }
}


class ReviewsFailure extends ReviewsState {
  final String errorMessage;
  ReviewsFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static ReviewsFailure fromJson(Map<String, dynamic> response) {
    return ReviewsFailure(response['err'] ?? 'Unknown error');
  }



}
