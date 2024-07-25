


import 'package:equatable/equatable.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/data/models/total_rate.dart';

abstract class ReviewsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviewModel;
  final int total ;
  final double rate;
  final TotalRate? totalRates;

  ReviewsSuccess(this.reviewModel, this.total, this.rate, this.totalRates);
  @override
  List<Object?> get props => [reviewModel];

  static ReviewsSuccess fromJson(Map<String, dynamic> response) {
    final reviews = (response['data']['reviews'] as List)
        .map((e) => ReviewModel.fromJson(e))
        .toList();
    final int allReviews= response['data']['cnt_reviews'];
    final double rate=double.parse( response['data']['rate']);
    final TotalRate? totalRates=TotalRate.fromJson(response['data']['cnt_rates']);

    return ReviewsSuccess(reviews,allReviews, rate, totalRates);
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
