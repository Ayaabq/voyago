import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/included_column.dart';


class IncludedCard extends StatelessWidget {
  const IncludedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
        title: "What's Included",
        content: IncludedColumn(
            airCondition: true,
            tourGuide: false,
            breakfast: true,
            wifi: true,
            lanch: false));
  }
}
