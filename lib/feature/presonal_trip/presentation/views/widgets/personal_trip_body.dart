import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offer_card.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/card_trip_offers_search.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/destination_cubit.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/destination_state.dart';

class PersonalTripBody extends StatelessWidget {
  const PersonalTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PrevCubit>().fetchDestinationInitial(Confg.allPrev);
    return BlocBuilder<PrevCubit, PrevState>(builder: (context, state){
      if(state is PrevSuccess){
        final trips=state.destinationModels;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 16.0, // Space between columns
              mainAxisSpacing: 16.0, // Space between rows
              childAspectRatio: .8
          ),
          itemBuilder: (context, index) {
            return  TripOfferSearchCard(trip: trips[index],);
          },
          itemCount: trips.length,
        );
      }else if(state is PrevFailure){
        return CustomFailureError(errMessage: state.errorMessage);
      }else{
        return LoadBase();
      }
    });
  }
}
