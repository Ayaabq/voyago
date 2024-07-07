import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/home/presentation/views/widgets/attractions/top_attraction_list_view.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../core/presentation/views/distenations/destination_item.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(title: "Destination",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
             height: 140,
               child: DestinationItem()),
            SizedBox(height: 11,),
            Text("Attraction",
              style: Styles.textStyle20W700,),
            SizedBox(height: 11,),
            TopAttractionListView()
          ],
        ));
  }
}
