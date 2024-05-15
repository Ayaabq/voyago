import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/attractions/attraction_card.dart';

class TopAttractionListView extends StatelessWidget {
  const TopAttractionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              AttractionCard(),
              SizedBox(width: 3,)
            ],
          );
        },
      ),
    );
  }
}
