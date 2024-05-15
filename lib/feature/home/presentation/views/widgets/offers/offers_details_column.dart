import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';
import '../../../../../../core/widgets/location_with_country.dart';
import '../../../../../../core/widgets/price_offer_display.dart';

class OffersDetailsColumn extends StatelessWidget {
  const OffersDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Damas hotel",
                    style: Styles.textStyle12W400,),
                  Spacer(),
                  CustomRating(rate: 4.2),
                ],
              ),
              LocationWithCountry(country: "Damascus"),
              PriceDisplay(oldPrice: "90\$", newPrice: "85\$", ratio: 10,)
            ],
          ),
        )
      ],
    );
  }
}
