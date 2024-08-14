import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';

import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/colum_search_trip.dart';
import 'package:voyago/feature/search/data/models/search_trip_model.dart';

class SearchTripImage extends StatelessWidget {
  const SearchTripImage({
    super.key, required this.trip,

  });

final TripSearchModel trip;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
          image: AssetImage(HomeAssets.dummyOffers),
          fit: BoxFit.fill,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color(0xff5E4DA7).withOpacity(0.5),
                const Color(0xffFEFEFF).withOpacity(0.0),
              ],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 8, top: 18, bottom: 11),
            child: ColumnSearchTrip( tripSearchModel: trip,),
          ),
        ),
      ),
    );
  }
}
