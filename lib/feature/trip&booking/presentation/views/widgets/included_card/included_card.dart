import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/active_included.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/feature_model.dart';

class IncludedCard extends StatelessWidget {
  const IncludedCard({super.key, required this.features});
  final List<Feature> features;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        title: "What's Included",
        content: ListView.separated(
          padding: const EdgeInsets.all(0),
          itemCount: features.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return ActiveIncluded(
                title: '${features[index].type}: ${features[index].name}');
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
  }
}
