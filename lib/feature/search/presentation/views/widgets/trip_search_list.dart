import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_cubit.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_state.dart';

import '../../../../../core/widgets/custom_failure_error.dart';
import '../../../../home/presentation/views/widgets/trip_search/trip_search_card.dart';

class TripSearchList extends StatelessWidget {
  const TripSearchList({super.key, required this.destination});
  final String destination;
  @override
  Widget build(BuildContext context) {
    context.read<TripSearchCubit>().fetchTripsInitial(destination, null);

    return    BlocBuilder<TripSearchCubit,TripsSearchState>
      (builder: (context,state) {
      if (state is TripsSearchSuccess) {
        final trips=state.tripModels;
        return SliverList.separated(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TripSearchCard(trip: trips[index],


              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) { return const SizedBox(
          width: 3,
        ); },
        );
      }
      else if (state is TripsSearchFailure) {
        return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CustomFailureError(errMessage: state.errorMessage),
              ],
            ));
      }
      else if (state is TripsSearchLoading) {
        return const SliverToBoxAdapter(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircularProgressIndicator(),
          ],
        ));
      } else {
        return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("search for attraction all around the wodr!"),
              ],
            ));
      }
    });

  }
}
