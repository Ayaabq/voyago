import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/icons_text.dart';

import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/availabe_number.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/form_price_trip.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/state_trips.dart';

class ColumnSearchTrip extends StatelessWidget {
  const ColumnSearchTrip({
    super.key,
    required this.fromPrice,
  });

  final String fromPrice;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Rome Trip",
        style: Styles.textStyle16W700.copyWith(color: CustomColors.kWhite[0]),
      ),
      const SizedBox(height: 5),
      //  const LocationWithCountry(country: "Italy"),
      IconsText(
        text: "Italy",
        icon: Icons.location_on,
        colorIcon: CustomColors.kWhite[3],
        sizeIcon: 15,
        style: Styles.textStyle14W600.copyWith(color: CustomColors.kWhite[3]),
      ),
      const SizedBox(height: 5),
      const CustomRating(rate: 4.8),
      const SizedBox(height: 5),
       Row(
        children: [
          AvailableNumber(
            availableNubmer: '5 / 20 ${"reserved".tr()}',
          ),
          SizedBox(width: 11),
          StateTrips(
            state: "Available".tr(),
          ),
        ],
      ),
      //    const TimeTrip(day: "1"),
      const SizedBox(height: 6),
      IconsText(
          text: "day".tr(),
          icon: Iconsax.timer_1,
          colorIcon: CustomColors.kWhite[3],
          sizeIcon: 15,
          style: Styles.textStyle10W600),
      Row(
        children: [
          IconsText(
            text: "8 Oct - 9 Oct",
            icon: Iconsax.calendar_2,
            //Icons.calendar_month_outlined,
            colorIcon: CustomColors.kWhite[3],
            sizeIcon: 16,
            style:
                Styles.textStyle14W600.copyWith(color: CustomColors.kWhite[0]),
          ),
          const Spacer(),
          FormPrice(fromPrice: fromPrice),
        ],
      )
    ]);
  }
}
