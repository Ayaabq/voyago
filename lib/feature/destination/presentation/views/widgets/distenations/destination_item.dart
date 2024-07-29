import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../data/models/destination_model.dart';
import 'destination_background.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({super.key,  this.destinationModel});
  final DestinationModel? destinationModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kDestinationDetailsView, extra:  destinationModel);
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(

          elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          child: DestinationBackground(destinationModel: destinationModel,),

        ),
      ),
    );
  }
}
