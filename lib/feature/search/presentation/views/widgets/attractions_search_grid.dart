import 'package:flutter/cupertino.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

import '../../../../attraction/presentation/views/widgets/attractions/attraction_card.dart';

class AttractionsSearchGrid extends StatelessWidget {
  const AttractionsSearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return   SliverGrid.builder(
      // padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 16.0, // Space between columns
        mainAxisSpacing: 16.0, // Space between rows
      ),
      itemCount: 19,
      itemBuilder: (context, index) {
        return AttractionCard(attractionModel:AttractionModel(id: 1, name: 'Homs', isFavourite: false, rate: 4.7));
      },
    );
  }
}
