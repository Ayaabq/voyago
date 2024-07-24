import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/core/widgets/places/place_details_background.dart';
import 'package:voyago/core/widgets/places/pictures_list.dart';
import 'package:voyago/core/widgets/places/place_details.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../reviews/presentation/veiws/widgets/reviews/reviews_card.dart';
import '../../../../trip&booking/presentation/views/widgets/trips/trips_view.dart';

class AttractionDetailsView extends StatelessWidget {
  const AttractionDetailsView({super.key, required this.attraction});
 final AttractionModel attraction;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Stack(
          children: [
            const PlaceDetailsBackground(),

            Padding(
              padding:  EdgeInsets.only(
                  top: ScreenSizeUtil.dynamicHeight(.22),
                  left: 12,
                  right: 12
              ),
              child:     Column(
                children: [

                  const CustomCard(content:PlaceDetails(),
                    title: "Top of the Rock",
                    titleStyle: Styles.textStyle24W900,),
                  const CustomCard(content:
                  Text("The Top of the Rock "
                      "Observation Deck offers 360-degree views of the iconic Manhattan skyline from 70 floors above Rockefeller Center. Visitors can take in sweeping vistas of Central Park, the Hudson River, and the city's famous landmarks from the expansive outdoor decks. As a popular attraction for both tourists and locals, the observation deck provides an unparalleled elevated perspective to experience the grandeur of New York City."),
                    title: "Description",

                  ),
                  CustomCard(
                    content: TripsView(url:Confg.attractionInfo2+ attraction.id.toString(), viewKey:  Key("attraction${attraction.id}"),inData: true,),
                    title: "Related trips",),
                  const CustomCard(
                    title: "Pictures",
                    content: PicturesList(),),
                  const ReviewsCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
