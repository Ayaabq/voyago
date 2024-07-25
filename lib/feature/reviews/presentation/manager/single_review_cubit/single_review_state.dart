import 'package:equatable/equatable.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/data/models/total_rate.dart';

abstract class SingleReviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SingleReviewInitial extends SingleReviewState {}

class SingleReviewLoading extends SingleReviewState {}

class SingleReviewSuccess extends SingleReviewState {
final message="Your review has been submitter successfully";
  SingleReviewSuccess();

  // static SingleReviewSuccess fromJson(Map<String, dynamic> response) {
  //   final msg = (response['msg']);
  //
  //
  //   return SingleReviewSuccess(reviews, allReviews, rate, totalRates);
  // }
}

class SingleReviewFailure extends SingleReviewState {
  final String errorMessage;
  SingleReviewFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static SingleReviewFailure fromJson(Map<String, dynamic> response) {
    return SingleReviewFailure(response['err'] ?? 'Unknown error');
  }
}
