import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/image_with_name.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageWithName(
            image: reviewModel.userImage, title: reviewModel.userName),
        const SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.kMove[3]),
              child: Row(
                children: [
                  CustomRating(rate: reviewModel.rating),
                  const Text("/5")
                ],
              ),
            ),
            Text(reviewModel.submittedAt.toString())
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Text(reviewModel.comment),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ],
    );
  }
}
