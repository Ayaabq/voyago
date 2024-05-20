
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';

class ItineraryCard extends StatelessWidget {
  const ItineraryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(title: "Itinerary", content: SizedBox(
      height: 500,
    ));
  }
}
