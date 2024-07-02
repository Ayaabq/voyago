import 'package:flutter/material.dart';


import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/ratig_diagram.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/review_card.dart';

import '../../../../data/models/review_model.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
            slivers: [
        const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverToBoxAdapter(child: RatingDiagram())),
        SliverList.builder(
          itemBuilder: (context, index) => Card(
            child: ReviewCard(
              reviewModel: ReviewModel(
                  userName: 'Rolana',
                  rate: 4.5,
                  review: 'It was a great trip with amazing guide, '
                      'the cruise was good and comfortable and the view was wonderful.',
                  reviewedAt: DateTime.now()),
            ),
          ),

          itemCount: 10,
        )
      ],
    );
  }
}
