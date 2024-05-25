import 'package:flutter/material.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/review_item.dart';

import '../../../data/models/review_model.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key, required this.reviews, required this.isScrollable});
  final List<ReviewModel> reviews;
  final bool isScrollable;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        physics: !isScrollable? const NeverScrollableScrollPhysics() : null,
      itemCount: reviews.length,
        itemBuilder: (context, index){
          return ReviewItem(reviewModel: reviews[index],);
    });
  }
}
