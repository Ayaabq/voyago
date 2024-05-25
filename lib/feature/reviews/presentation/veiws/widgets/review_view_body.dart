import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_elevated_button.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews_list.dart';

import '../../../../../core/utils/assets.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ReviewsList(
              reviews: [
                ReviewModel(
                  rating: 4.8,
                  userName: "aya bakleh",
                  submittedAt: DateTime.now(),
                  comment: "It was a great trip with amazing guide the crulse",
                  userImage: AssetImage(AssetsData.logoAllColors),
                ), ReviewModel(
                  rating: 4.8,
                  userName: "aya bakleh",
                  submittedAt: DateTime.now(),
                  comment: "It was a great trip with amazing guide the crulse",
                  userImage: AssetImage(AssetsData.logoAllColors),
                ),
              ],
              isScrollable: false,
            )),
        CustomElevatedButton(label: "Write a review", onPressed: (){})
      ],
    );
  }
}
