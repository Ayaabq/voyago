import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_cubit.dart';

import 'package:voyago/feature/trip&booking/presentation/views/widgets/itinerary/Itinerary_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/image_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/places_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trip_info_2_section/trip_info_2_section.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../reviews/presentation/veiws/widgets/reviews/reviews_card.dart';
import '../../../data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import '../maneger/trip_info_3_places_cubit/trip_info_3_places_cubit.dart';

class TripViewBody extends StatelessWidget {
  const TripViewBody({super.key, required this.controller, required this.id});
  final ScrollController controller;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          ImageCard(
            id: id,
          ),
          const SizedBox(
            height: 5,
          ),
          BlocProvider(
            create: (_) => TripInfo2Cubit(getIt.get<TripDetailsRepoImp>()),
            child: TripInfo2Section(
              id: id,
            ),
          ),
            BlocProvider(
            create: (_) => ItineraryCubit(getIt.get<TripDetailsRepoImp>()),
            child: ItineraryCard(id: id,),
          ),

          BlocProvider(
            create: (_) => TripInfo3PlacesCubit(getIt.get<TripDetailsRepoImp>()),
            child: PlacesCard(id: id,)
          )
          ,
          ReviewsCard(url: Confg.tripReviews+ id.toString(),
          fullUrl: Confg.tripFullReviews+ id.toString(),
          addUrl: Confg.tripAddReviews+ id.toString(),),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
