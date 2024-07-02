import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/rating_column.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/reviews_stars.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

class RatingDiagram extends StatelessWidget {
  const RatingDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingColumn(rate: 4.8,total: 118,),
        SizedBox(width: 8,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ReviewsStars(starCount: 5, count: 65, total: 118),
              ReviewsStars(starCount: 4, count: 20, total: 118),
              ReviewsStars(starCount: 3, count: 15, total: 118),
              ReviewsStars(starCount: 2, count: 18, total: 118),
              ReviewsStars(starCount: 1, count: 2, total: 118),

            ],
          ),
        ),
      ],
    );
  }
}
