import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_card.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

class ReviewsConlumn extends StatelessWidget {
  const ReviewsConlumn({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    context.read<ReviewsCubit>().fetchReviewsInitial(url);
    return BlocBuilder<ReviewsCubit, ReviewsState>(builder: (context, state) {
      if (state is ReviewsSuccess) {
        final List<ReviewModel> reviews = state.reviewModel;
        return Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              decoration: BoxDecoration(
                color: CustomColors.kMove[2],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                   CustomRating(
                    rate: state.rate,
                    iconSize: 16,
                    fontStyle: Styles.textStyle14W600,
                  ),
                  const Spacer(),
                  Text(
                    '${state.total} Reviews',
                    style: Styles.textStyle14W400
                        .copyWith(color: CustomColors.kGrey[2]),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                child: ReviewCard(
                  reviewModel: reviews[index],
                ),
              ),
              itemCount: reviews.length,
              //  separatorBuilder: (BuildContext context, int index) => const Divider(),
            )
          ],
        );
      } else if (state is ReviewsFailure) {
        return CustomFailureError(errMessage: state.errorMessage);
      } else {
        return LoadBase(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                decoration: BoxDecoration(
                  color: CustomColors.kMove[2],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    const CustomRating(
                      rate: 4.8,
                      iconSize: 16,
                      fontStyle: Styles.textStyle14W600,
                    ),
                    const Spacer(),
                    Text(
                      '118 Reviews',
                      style: Styles.textStyle14W400
                          .copyWith(color: CustomColors.kGrey[2]),
                    ),
                  ],
                ),
              ),
              ReviewCard(
                reviewModel: ReviewModel(
                    userName: 'Rolana',
                    rate: 4.5,
                    review: 'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                    reviewedAt: DateTime.now()),
              ),
              const Divider(),
              ReviewCard(
                reviewModel: ReviewModel(
                    userName: 'Rolana',
                    rate: 4.5,
                    review: 'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                    reviewedAt: DateTime.now()),
              )
            ],
          ),
        );
      }
    });
  }
}
