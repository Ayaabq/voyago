import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/data/repo/review_repo_impl.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/reviews_conlumn.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../../../../../../core/utils/styles.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewCard({
    super.key,
    required this.reviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: reviewModel.image,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reviewModel.userName, style: Styles.textStyle16W700),
                  Text(reviewModel.reviewedAt.toString(),
                      style: Styles.textStyle12W400
                          .copyWith(color: CustomColors.kGrey[1])),
                ],
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CustomColors.kMove[3]),
                  child: CustomRating(
                      rate: reviewModel.rate != null
                          ? reviewModel.rate!.toDouble()
                          : 0.0)),
            ],
          ),
          const SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
          if (reviewModel.review != null)
            Text(reviewModel.review!, style: Styles.textStyle14W600),
        ],
      ),
    );
  }
}
