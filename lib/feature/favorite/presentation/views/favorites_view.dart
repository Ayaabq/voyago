import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/views/widgets/attractions/attraction_card.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/distenations/destination_item.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/distenations/destinations_view.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trip_card.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../books/presentation/views/books_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesBody();
  }
}

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabs: [
        Tab(
          text: "Destinations".tr(),
        ),
        Tab(
          text: "Attractions".tr(),
        ),
        Tab(
          text: "Trips".tr(),
        ),
      ],
      titel: "My favorites".tr(),
      tabViews: [
        GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return DestinationItem(
                destinationModel:
                    DestinationModel(id: 1, name: "k", isFavourite: false));
          },
        ),
        GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return AttractionCard(attractionModel: AttractionModel(id: 0, name: '', isFavourite: false, rate: 4.5));
          },
        ),
        GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return  TripCard(tripModel: TripModel(id: 1, name: '',
                image: '', isFavourite: false, rate: 2, price: 23, destination: '', duration: 23));



          },
        ),
      ],
    );
  }
}

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Wallet.favoritesEmpty,
          height: 175,
          width: 235,
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "You have no favorites yet!!".tr(),
            style: Theme.of(context).brightness == Brightness.dark
                ? Styles.textStyle20W600dark
                : Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
