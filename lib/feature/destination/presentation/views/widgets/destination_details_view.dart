import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/pictures_list.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/place_info_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_list_view.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../attraction/presentation/views/widgets/attractions/attraction_view.dart';
import '../../../../images/data/repo/images_repo_impl.dart';
import '../../../../images/presentation/manager/all_images_cubit/images_cubit.dart';
import '../../../../images/presentation/views/custom)netowk_image.dart';
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
    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
             PlaceDetailsBackground(id: destinationModel.id, url: Confg.destinationImage,),
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
                    title: "Where to go".tr(),
                  ),
                  CustomCard(
                    content: AttractionView(
                      url: Confg.destinationInfo2+destinationModel.id.toString(),
                      viewKey: Key('destinatoin+ ${destinationModel.id}'),
                    ),
                    title: "What to do".tr(),
                  ),
                   CustomCard(
                    title: "Pictures".tr(),
                    content: BlocProvider(
                      create: (context) => AllImagesCubit(getIt.get<ImagesRepoImpl>()),
                      child: PicturesList(id: destinationModel.id, url:
                      Confg.allDestinationImages,),

                    ),
                  ),
                   ReviewsCard(url: Confg.destinationReviews+destinationModel.id.toString(),
                   fullUrl: Confg.destinationFullReviews+destinationModel.id.toString(),
                   addUrl: Confg.destinationAddReviews+destinationModel.id.toString(),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
