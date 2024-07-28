
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_2_model.dart';

import '../../../../../../core/helper/date_time_helper.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../over_view_card/icon_text_view.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({super.key, required this.trip, required this.child, required this.adults});
  final TripInfo2Model trip;
  final int child;
  final int adults;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            HomeAssets
                .dummyOffers, // replace with your image asset path
            height: 120,
            width: ScreenSizeUtil.dynamicWidth(.35),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            IconText(
              icon: Iconsax.user,
              title: '$adults Adults, $child Child',
              iconColor: CustomColors.kMove[5],
            ),
            IconText(
                icon: Iconsax.calendar_tick,
                title: DateTimeHelper.formatDateMMMDY(trip.startDate),
                iconColor: CustomColors.kMove[5]),
            IconText(
                icon: Iconsax.clock,
                title: "${trip.duration} Hours",
                iconColor: CustomColors.kMove[5]),
          ],
        ),
      ],
    );
  }
}
