import 'package:flutter/material.dart';
import 'package:voyago/feature/reviews/data/models/total_rate.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/rating_column.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/reviews_stars.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

class RatingDiagram extends StatelessWidget {
  const RatingDiagram({super.key, required this.rate, required this.totalRate, required this.totalReviews});
final double rate;
final int totalReviews;
final TotalRate totalRate;
  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingColumn(rate: rate,total: totalReviews,),
        const SizedBox(width: 8,),
         Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ReviewsStars(starCount: 5, count:totalRate.five, total: totalReviews),
              ReviewsStars(starCount: 4, count: totalRate.four, total: totalReviews),
              ReviewsStars(starCount: 3, count: totalRate.three, total: totalReviews),
              ReviewsStars(starCount: 2, count: totalRate.two, total: totalReviews),
              ReviewsStars(starCount: 1, count: totalRate.one, total: totalReviews),

            ],
          ),
        ),
      ],
    );
  }
}
