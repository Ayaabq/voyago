import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_home_list.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/background/beckround_section.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_search_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/trip_offer_listview.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_view.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../attraction/presentation/views/widgets/attractions/attraction_view.dart';
import '../../../../destination/presentation/views/widgets/distenations/destinations_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        const BackgroundSection(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomHomeList(
                  title: "Special offers".tr(),
                  sizedList: const OffersListView(),
                ),
                 CustomHomeList(
                  title: "Trending Destinations".tr(),
                  sizedList: const DestinationsView(
                    url: Confg.trendingDestinationsUrl,
                    viewKey: Key('trendingDestinations'),
                  ),
                ),
                 CustomHomeList(
                  title: "Top Attractions".tr(),
                  sizedList: const AttractionView(
                    url: Confg.topAttractionsUrl,
                    viewKey: Key('topAttractions'),
                  ),
                ),
                 CustomHomeList(
                  title: "Top Trips".tr(),
                  sizedList: const TripsView(
                    url: Confg.topTrips,
                    viewKey: Key('topTrips'),
                    inData: false,
                  ),
                ),
                 CustomHomeList(
                  title: "Popular Attractions".tr(),
                  sizedList: const AttractionView(
                    url: Confg.topAttractionsUrl,
                    viewKey: Key('popularAttractions'),
                  ),
                ),
                 CustomHomeList(
                  title: "Popular Trips".tr(),
                  sizedList: const TripsView(
                    url: Confg.popularTrips,
                    viewKey: Key('popularTrips'),
                    inData: false,
                  ),
                ),
                 CustomHomeList(
                  title: "Offers trips".tr(),
                  sizedList: const TripsOffersListView(),
                ),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SearchTripsListView(),
          ),
        ),
      ],
    );
  }
}
