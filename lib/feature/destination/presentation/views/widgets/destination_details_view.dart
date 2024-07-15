import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/destination_background.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/pictures_list.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/place_details.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_list_view.dart';

import '../../../../../core/utils/screen_size_util.dart';
import '../../../../trip&booking/presentation/views/widgets/reviews/reviews_card.dart';

class DestinationDetailsView extends StatelessWidget {
  const DestinationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
           const DestinationBackground(),
        
             Padding(
               padding:  EdgeInsets.only(
                 top: ScreenSizeUtil.dynamicHeight(.22),
                 left: 12,
                 right: 12
               ),
               child:   const Column(
                children: [
        
                  CustomCard(content:PlaceDetails(),
                  title: "Top of the Rock",
                  titleStyle: Styles.textStyle24W900,),
                  CustomCard(content:
                  Text("The Top of the Rock "
                      "Observation Deck offers 360-degree views of the iconic Manhattan skyline from 70 floors above Rockefeller Center. Visitors can take in sweeping vistas of Central Park, the Hudson River, and the city's famous landmarks from the expansive outdoor decks. As a popular attraction for both tourists and locals, the observation deck provides an unparalleled elevated perspective to experience the grandeur of New York City."),
                  title: "Description",
                    
                  ),
                  CustomCard(
                    content: TopTripsListView(),
                    title: "Related trips",),
                  CustomCard(
                    title: "Pictures",
                    content: PicturesList(),),
                  ReviewsCard(),
                ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
