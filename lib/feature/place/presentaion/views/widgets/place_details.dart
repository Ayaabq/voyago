import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:voyago/core/widgets/toast/toast.dart';
import 'package:voyago/feature/location&map/presentation/manager/location_cubit.dart';
import 'package:voyago/feature/location&map/presentation/manager/location_state.dart';
import 'package:voyago/feature/place/data/models/place_model.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate.dart';


class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.placeModel});
  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

         Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 35,

            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                  placeModel.location,
                  style:Styles.textStyle13W400
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),

        TextButton.icon(

          onPressed: () async{

            LocationData? location=await context.read<LocationCubit>().fetchPlaceLocation(placeModel.name);
            final currentState = context.read<LocationCubit>().state;
            if(LocationCubit.placeLat != null ){
              final lat=LocationCubit.placeLat;
              final lng=LocationCubit.placeLong;
              GoRouter.of(context).push('${AppRouter.kLocationView}/$lat/$lng', extra: placeModel.name);

            }else{
              showTopToast("The place has no map location");
            }
          },

          icon: const Icon(Icons.map),
          label:  Text("View on Map".tr()),
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all( CustomColors.kBlack[1]),
              backgroundColor: WidgetStateProperty.all( CustomColors.kGrey[0])
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
             CustomRating(rate: placeModel.rate),
            const SizedBox(width: 4),
            Text(
              '(${placeModel.reviews} ${"Reviews".tr()})',
              style: Styles.textStyle14W400.copyWith(
                  color: CustomColors.kGrey[2]
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if(placeModel.tripsIncluded!=null)
          Text(
          '${"Included in".tr()} ${placeModel.tripsIncluded} ${"trip(s)".tr()}',
          style:Styles.textStyle14W600,)

      ],
    );
  }
}
