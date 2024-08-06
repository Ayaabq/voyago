import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/views/widgets/trip_search/trip_search_card.dart';

class TripSearchList extends StatelessWidget {
  const TripSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return    SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TripSearchCard(

            fromPrice: '80',
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(
      width: 3,
    ); },
    );

  }
}
