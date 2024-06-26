import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/card_trip_offers_search.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trips/trip_card.dart';

import '../../../../../../../core/utils/screen_size_util.dart';

class TripsOffersListView extends StatelessWidget {
  const TripsOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return SizedBox(
      height: 240,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              TripOfferSearchCard(),
              SizedBox(
                width: 3,
              )
            ],
          );
        },
      ),
    );
  }
}
