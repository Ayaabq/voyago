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
    // Get the screen size
  ScreenSizeUtil.init(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // Use a fraction of the screen width and height instead of fixed values
          width: ScreenSizeUtil.screenWidth * 0.8,
          height:ScreenSizeUtil.screenHeight * 0.2,
          child: const Column(
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
