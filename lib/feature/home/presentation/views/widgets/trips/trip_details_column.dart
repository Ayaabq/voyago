import 'package:flutter/material.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/widgets/days_and_price.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

import '../../../../../../core/widgets/location_with_country.dart';

// class TripDetailsColumn extends StatelessWidget {
//   const TripDetailsColumn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: 148,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//
//                 children: [
//                   Text("Damas hotel",
//                     style: Styles.textStyle12W400,),
//                   Spacer(),
//                   CustomRating(rate: 4.2),
//                 ],
//               ),
//               LocationWithCountry(country: "Damascus"),
//               DaysAndPriceWidget(days: "5", fromPrice: "99")
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/days_and_price.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

import '../../../../../../core/widgets/location_with_country.dart';

class TripDetailsColumn extends StatelessWidget {
  const TripDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
  ScreenSizeUtil.init(context);
    return  const Column(
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
              DaysAndPriceWidget(days: "5", fromPrice: "99")
            ],
          ),
        )
      ],
    );
  }
}
