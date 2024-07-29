import 'package:easy_localization/easy_localization.dart';
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
      tabs:  [
        Tab(
          text: "Destinations".tr(),
        ),
        Tab(
          text: "Attractions".tr(),
        ),
        Tab(
          text: "Trips".tr(),
        ),
      ],
      titel: "My Reviews".tr(),
      tabViews:  [
        const ReviewsEmpty(),
        Text("My favorites".tr()),
        Text("My favorites".tr()),
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
            "You have no reviews yet!!".tr(),
            style: Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
