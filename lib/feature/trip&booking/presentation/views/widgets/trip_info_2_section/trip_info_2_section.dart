import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trip_info_2_section/notes_card.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../../core/widgets/shimmer/load_base.dart';
import '../../../../data/models/trip_info_2_model.dart';
import '../../../../data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../../maneger/trip_info_2_cubit/trip_info_2_state.dart';
import 'description_card.dart';
import '../included_card/included_card.dart';
import 'meeting_point_card.dart';
import '../over_view_card/over_view_card.dart';

class TripInfo2Section extends StatelessWidget {
  const TripInfo2Section({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    context.read<TripInfo2Cubit>().fetchTripDetailsInfo1(id);
    return BlocBuilder<TripInfo2Cubit, TripInfo2State>(
      builder: (context, state) {
        if (state is TripInfo2Success) {
          TripInfo2Model trip = state.tripInfo2Model;
          return Column(
            children: [
              OverViewCard(tripInfo2Model: trip),
              DescriptionCard(description: trip.description),
              IncludedCard(
                features: trip.features,
              ),
              MeetingPointCard(
                details: trip.meetPoint,
              ),
              NotesCard(
                timeCancel: trip.timeCancellation,
              ),
            ],
          );
        } else if (state is TripInfo2Failure) {
          return CustomFailureError(errMessage: state.errorMessage);
        } else {
          return const LoadBase(
              child: Column(
            children: [
              CustomCard(
                content: SizedBox(
                  height: 200,
                ),
              ),
              CustomCard(
                content: SizedBox(
                  height: 250,
                ),
              ),
              CustomCard(
                content: SizedBox(
                  height: 250,
                ),
              ),
              CustomCard(
                content: SizedBox(
                  height: 150,
                ),
              ),
              CustomCard(
                content: SizedBox(
                  height: 250,
                ),
              ),
              CustomCard(
                content: SizedBox(
                  height: 250,
                ),
              ),
            ],
          ));
        }
      },
    );
  }
}
