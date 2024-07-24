import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/pictures_list.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/place_info_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_list_view.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../attraction/presentation/views/widgets/attractions/attraction_view.dart';
import '../../../../place/presentaion/views/widgets/place_details.dart';
import '../../../../place/presentaion/views/widgets/place_details_background.dart';
import '../../../../reviews/presentation/veiws/widgets/reviews/reviews_card.dart';
import '../../../../trip&booking/presentation/views/widgets/trips/trips_view.dart';

class DestinationDetailsView extends StatelessWidget {
  const DestinationDetailsView({super.key, required this.destinationModel});
  final DestinationModel destinationModel;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const PlaceDetailsBackground(),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenSizeUtil.dynamicHeight(.22), left: 12, right: 12),
              child: Column(
                children: [
                  PlaceInfoView(
                      url: Confg.destinationInfo1 +
                          destinationModel.id.toString()),
                  CustomCard(
                    content: TripsView(
                      url: Confg.destinationInfo3 +
                          destinationModel.id.toString(),
                      inData: false,
                      viewKey: Key("destination${destinationModel.id}"),
                    ),
                    title: "Where to go",
                  ),
                  CustomCard(
                    content: AttractionView(
                      url: Confg.destinationInfo2+destinationModel.id.toString(),
                      viewKey: Key('destinatoin+ ${destinationModel.id}'),
                    ),
                    title: "What to do",
                  ),
                  const CustomCard(
                    title: "Pictures",
                    content: PicturesList(),
                  ),
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
