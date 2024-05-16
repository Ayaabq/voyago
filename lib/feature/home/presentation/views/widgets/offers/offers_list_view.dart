import 'package:flutter/material.dart';

import 'offer_card.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              OfferCard(),
              SizedBox(width: 3,)
            ],
          );
        },
      ),
    );
  }
}
