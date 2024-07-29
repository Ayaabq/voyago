import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/pictures_list.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/place_info_view.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../place/presentaion/views/widgets/place_details_background.dart';
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

                   PlaceInfoView(url: Confg.attractionInfo1+attraction.id.toString()),
                  CustomCard(
                    content: TripsView(url:Confg.attractionInfo2+ attraction.id.toString(), viewKey:  Key("${"attraction".tr()}${attraction.id}"),inData: true,),
                    title: "Related trips".tr(),),
                   CustomCard(
                    title: "Pictures".tr(),
                    content: PicturesList(),),
                   ReviewsCard(url: Confg.attractionReviews +attraction.id.toString(),
                     fullUrl:  Confg.attractionFullReviews+attraction.id.toString(),
                     addUrl: Confg.attractionAddReviews+attraction.id.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
