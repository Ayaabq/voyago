import 'package:flutter/material.dart';
import 'package:voyago/feature/place/data/models/place_model.dart';

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
            Icon(
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

          onPressed: () {
            // Action to view on map
          },

          icon: const Icon(Icons.map),
          label: const Text('View on Map'),
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
              '(${placeModel.reviews} Reviews)',
              style: Styles.textStyle14W400.copyWith(
                  color: CustomColors.kGrey[2]
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if(placeModel.tripsIncluded!=null)
          Text(
          'Included in ${placeModel.tripsIncluded} trip(s)',
          style:Styles.textStyle14W600,)

      ],
    );
  }
}
