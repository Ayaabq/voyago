import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_home_list.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/background/beckround_section.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_search_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/trip_offer_listview.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../attraction/presentation/views/attractions/attraction_view.dart';
import '../../../../destination/presentation/views/widgets/distenations/destinations_view.dart';
import '../../../../trip&booking/presentation/views/widgets/trips/trips_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const CustomScrollView(
      slivers: [

        BackgroundSection(),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomHomeList(
                  title: "Spacial offers",
                  sizedList: OffersListView(),
                ),
                CustomHomeList(
                  title: "Trending Destinations",
                  sizedList: DestinationsView(url:  Confg.trendingDestinationsUrl,),
                ),
                CustomHomeList(
                  title: "Top Attractions",
                  sizedList: AttractionView(url: Confg.topAttractionsUrl),
                ),
                CustomHomeList(
                  title: "Top Trips",
                  sizedList: TopTripsListView(),
                ),
                CustomHomeList(
                  title: "Popular Attractions",
                  // TODO: replace the  url of popular
                  sizedList: AttractionView(url: Confg.topAttractionsUrl),
                ),
                CustomHomeList(
                  title: "Popular trips",
                  sizedList: TopTripsListView(),
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
