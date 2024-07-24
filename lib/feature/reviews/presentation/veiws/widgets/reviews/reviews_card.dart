import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_card.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Reviews",
      onTap: (){
        GoRouter.of(context).push(AppRouter.kReviewsView);
      },
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
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
                review:
                    'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                reviewedAt: DateTime.now()),
          ),
          const Divider(),
          ReviewCard(
            reviewModel: ReviewModel(
                userName: 'Rolana',
                rate: 4.5,
                review:
                    'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                reviewedAt: DateTime.now()),
          )
        ],
      ),
    );
  }
}

