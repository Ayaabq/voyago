import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/attractions/top_attraction_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/background/beckround_section.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_home_list.dart';
import 'package:voyago/feature/home/presentation/views/widgets/distenations/destination_list.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_list_view.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trips/top_trips_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          BackgroundSection(),
          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomHomeList(
                    title: "Spacial offers",
                    sizedList: OffersListView(),
                  ),
                  CustomHomeList(
                    title: "Spacial offers",
                    sizedList: OffersListView(),
                  ),
                  CustomHomeList(
                    title: "Trending Destinations",
                    sizedList: DestinationListView(),
                  ),
                  CustomHomeList(
                    title: "Top Attractions",
                    sizedList: TopAttractionListView(),
                  ),
                  CustomHomeList(
                    title: "Top Trips",
                    sizedList: TopTripsListView(),
                  ),
                  CustomHomeList(
                    title: "Popular Attractions",
                    sizedList: TopAttractionListView(),
                  ),
                  CustomHomeList(
                    title: "Popular trips",
                    sizedList: TopTripsListView(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
