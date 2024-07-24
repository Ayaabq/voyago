import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../utils/styles.dart';
import '../custom_rate.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Row(
          children: [
            Icon(
              Icons.location_on,
              size: 35,

            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                  '30 Rockefeller Plaza, 50th Street, between 5th & 6th Avenues, New York City, NY 10111',
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
              foregroundColor: MaterialStateProperty.all( CustomColors.kBlack[1]),
              backgroundColor: MaterialStateProperty.all( CustomColors.kGrey[0])
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const CustomRating(rate: 4.1),
            const SizedBox(width: 4),
            Text(
              '(2,780 Reviews)',
              style: Styles.textStyle14W400.copyWith(
                  color: CustomColors.kGrey[2]
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Included in 25 trip(s)',
          style:Styles.textStyle14W600,)

      ],
    );
  }
}
