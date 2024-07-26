import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/itinerary/itinerary_content.dart';

import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../../core/widgets/shimmer/load_base.dart';

class ItineraryCard extends StatelessWidget {
  const ItineraryCard({super.key, required this.id});
    final int id;
  @override
  Widget build(BuildContext context) {
    context.read<ItineraryCubit>().fetchTripsInitial(id);
    return   BlocBuilder<ItineraryCubit, ItineraryState>(
      builder: (context, state) {
        if (state is ItinerarySuccess) {
         return   CustomCard(
           title: "Itinerary",
           content: ItineraryContent(itineraryDays: state.itineraryDays,),
         );
        }
        else if (state is ItineraryFailure) {
          return CustomFailureError(errMessage: state.errorMessage);
        } else {
          return const LoadBase(
              child: CustomCard(
                content: SizedBox(
                  height: 250,
                ),
              ));
        }
      },
    );
  }
}
