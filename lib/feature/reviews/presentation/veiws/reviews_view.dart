import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../books/presentation/views/books_view.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReviewsBody();
  }
}

class ReviewsBody extends StatelessWidget {
  const ReviewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabs: const [
        Tab(
          text: "Destinations",
        ),
        Tab(
          text: "Attractions",
        ),
        Tab(
          text: "Trips ",
        ),
      ],
      titel: 'My Reviews',
      tabViews: const [
        ReviewsEmpty(),
        Text("My Reviews"),
        Text("My Reviews"),
      ],
    );
  }
}

class ReviewsEmpty extends StatelessWidget {
  const ReviewsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Wallet.reviewsEmpty,
          height: 175,
          width: 235,
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "You have no reviews yet!!",
            style: Theme.of(context).brightness == Brightness.dark
                ? Styles.textStyle20W600dark
                : Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
