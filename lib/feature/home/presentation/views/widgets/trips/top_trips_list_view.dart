import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trips/trip_card.dart';

import '../../../../../../core/utils/screen_size_util.dart';

class TopTripsListView extends StatelessWidget {
  const TopTripsListView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return SizedBox(
      height: 200,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              TripCard(),
              SizedBox(width: 3,)
            ],
          );
        },
      ),
    );
  }
}
