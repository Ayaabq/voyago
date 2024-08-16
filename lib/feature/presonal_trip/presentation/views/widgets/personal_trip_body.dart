import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offer_card.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/card_trip_offers_search.dart';

class PersonalTripBody extends StatelessWidget {
  const PersonalTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 16.0, // Space between columns
        mainAxisSpacing: 16.0, // Space between rows
        childAspectRatio: .8
      ),
      itemBuilder: (context, index) {
        return const TripOfferSearchCard();
      },
      itemCount: 10,
    );
  }
}
