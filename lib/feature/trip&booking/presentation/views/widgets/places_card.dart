import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_state.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../core/widgets/shimmer/load_base.dart';
import '../../../../attraction/presentation/views/widgets/attractions/top_attraction_list_view.dart';
import '../../../../destination/presentation/views/widgets/distenations/destination_item.dart';
import '../../../data/models/trip_info_3_places_model.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key, required this.id, this.url});
  final int id;
  final String? url;
  @override
  Widget build(BuildContext context) {
    context.read<TripInfo3PlacesCubit>().fetchTripDetailsInfo3(id,url);
    return BlocBuilder<TripInfo3PlacesCubit, TripInfo3PlacesState>(
      builder: (context, state) {
        if (state is TripInfo3PlacesSuccess) {
          print(state.tripInfo3Model.attractions);
          print(state.tripInfo3Model.attractions);

          TripInfo3PlacesModel trip = state.tripInfo3Model;
          return  CustomCard(
            title: "Destination".tr(),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 140,
                    child: DestinationItem(destinationModel: trip.destination,)),
                const SizedBox(
                  height: 11,
                ),
                if(trip.attractions!=null)
                   Text(
                  "Attraction".tr(),
                  style: Styles.textStyle20W700,
                ),
                const SizedBox(
                  height: 11,
                ),
                if(trip.attractions!=null)
                AttractionListView(
                  attractions: trip.attractions,
                )
              ],
            ),
          );
        } else if (state is TripInfo3PlacesFailure) {
          return CustomFailureError(errMessage: state.errorMessage);
        } else {
          return  LoadBase(
              child: CustomCard(
            title: "Destination".tr(),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 140,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  "Attraction".tr(),
                  style: Styles.textStyle20W700,
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ));
        }
      },
    );
  }
}
