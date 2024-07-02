import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/floating_add_review.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/review_view_body.dart';



class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
        ),
        body: ReviewsViewBody(),
        floatingActionButton: FloatingAddReview(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ),
    );
  }
}

