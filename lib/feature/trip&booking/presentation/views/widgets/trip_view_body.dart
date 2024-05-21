import 'package:flutter/material.dart';

import 'package:voyago/feature/trip&booking/presentation/views/widgets/Itinerary_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/description_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/image_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/included_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/meeting_point_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/notes_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/over_view_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/places_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews_card.dart';

class TripViewBody extends StatelessWidget {
  const TripViewBody({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      controller: controller,
      child: const Column(
        children: [
         ImageCard(),
          SizedBox(height: 5,),
          OverViewCard(),
          DescriptionCard(),
          IncludedCard(),
          MeetingPointCard(),
          ItineraryCard(),
          NotesCard(),
          PlacesCard(),
          ReviewsCard(),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
