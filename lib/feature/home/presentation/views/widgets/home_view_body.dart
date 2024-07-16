import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_home_list.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/background/beckround_section.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_search_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/trip_offer_listview.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_view.dart';
import 'package:voyago/feature/attraction/presentation/views/attractions/attraction_view.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../destination/presentation/views/widgets/distenations/destinations_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BackgroundSection(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomHomeList(
                  title: "Special offers",
                  sizedList: OffersListView(),
                ),
                CustomHomeList(
                  title: "Trending Destinations",
                  sizedList: DestinationsView(
                    url: Confg.trendingDestinationsUrl,
                    viewKey: Key('trendingDestinations'),
                  ),
                ),
                CustomHomeList(
                  title: "Top Attractions",
                  sizedList: AttractionView(
                    url: Confg.topAttractionsUrl,
                    viewKey: Key('topAttractions'),
                  ),
                ),
                CustomHomeList(
                  title: "Top Trips",
                  sizedList: TripsView(
                    url: Confg.topTrips,
                    viewKey: Key('topTrips'),
                  ),
                ),
                CustomHomeList(
                  title: "Popular Attractions",
                  sizedList: AttractionView(
                    url: Confg.topAttractionsUrl,
                    viewKey: Key('popularAttractions'),
                  ),
                ),
                CustomHomeList(
                  title: "Popular Trips",
                  sizedList: TripsView(
                    url: Confg.popularTrips,
                    viewKey: Key('popularTrips'),
                  ),
                ),
                CustomHomeList(
                  title: "Offers trips",
                  sizedList: TripsOffersListView(),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SearchTripsListView(),
          ),
        ),
      ],
    );
  }
}
