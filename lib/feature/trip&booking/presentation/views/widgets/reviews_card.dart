
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/review_view_body.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(title: "Reviews", content: SizedBox(
      height: 500,
      child: ReviewsViewBody(),
    ));
  }
}
