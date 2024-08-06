import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/feature/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:voyago/feature/favorite/presentation/manager/favorite_cubit/favorite_state.dart';

import '../../../../attraction/data/models/attraction_model.dart';
import '../../../../attraction/presentation/views/widgets/attractions/attraction_card.dart';
import '../../../../books/presentation/views/books_view.dart';
import '../../../../destination/data/models/destination_model.dart';
import '../../../../destination/presentation/views/widgets/distenations/destination_item.dart';
import '../../../../trip&booking/data/models/trip_model.dart';
import '../../../../trip&booking/presentation/views/widgets/trips/trip_card.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().fetchFavorite();
    return  BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context,state){
      if(state is FavoriteSuccess){
        final trips= state.trips;
        final destinations=state.destinations;
        final attractions=state.attractions;
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
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16.0, // Space between columns
                mainAxisSpacing: 16.0, // Space between rows
              ),
              itemCount:destinations.length,
              itemBuilder: (context, index) {
                return DestinationItem(
                    destinationModel:destinations[index]);
              },
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16.0, // Space between columns
                mainAxisSpacing: 16.0, // Space between rows
              ),
              itemCount: attractions.length,
              itemBuilder: (context, index) {
                return AttractionCard(attractionModel:attractions[index]);
              },
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16.0, // Space between columns
                mainAxisSpacing: 16.0, // Space between rows
              ),
              itemCount:trips.length,
              itemBuilder: (context, index) {
                return  TripCard(tripModel: trips[index]);



              },
            ),
          ],
        );
      }else if( state is FavoriteFailure){
        return Center(child: CustomFailureError(errMessage: state.errorMessage));
      }
      else{
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
