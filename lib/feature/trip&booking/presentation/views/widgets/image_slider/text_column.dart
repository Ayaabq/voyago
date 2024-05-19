import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';
import '../../../../../../core/widgets/location_with_country.dart';

class TexColumn extends StatelessWidget {
  const TexColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Berlin: 3-Hours City Tour by Boat ",
          style: Styles.textStyle20W700,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6,),
        Row(
          children: [
            const LocationWithCountry(country: "Berlin, Germany"),
            const Spacer(),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CustomColors.kGrey[0]
                ),
                child: const LocationWithCountry(country: "View on Map", ),
              ),
            )
          ],
        ),
        const SizedBox(height: 6,),
        Row(
          children: [
            const CustomRating(rate: 4.8),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CustomColors.kGrey[0]
              ),
              child: const Text("113 reviw",
              style: Styles.textStyle13W400,),
            ),

          ],
        )
      ]),
    );
  }
}
