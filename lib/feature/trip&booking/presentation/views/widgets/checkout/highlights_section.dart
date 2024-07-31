import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_2_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/highlights_card.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../over_view_card/icon_text_view.dart';

class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key, required this.trip, required this.child, required this.adults, required this.name});
  final TripInfo2Model trip;
  final int child;
  final int adults;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6.0),
        IconText(
          isLast: true,
          iconColor: CustomColors.kMove[5],
          iconSize: 32,
          icon: Icons.trip_origin,
          title: name, textStyle:
        Styles.textStyle24W900.copyWith(fontWeight: FontWeight.normal),)
       ,
        // const SizedBox(height: 6.0),
         HighlightCard(trip: trip, adults: adults,
         child: child,),
        const SizedBox(height: 12.0),
        IconText(
          isLast: true,
          icon: Iconsax.location,
          title: "Meeting Point:".tr(),
          iconColor: CustomColors.kMove[5],
          textStyle:
              Styles.textStyle16W700.copyWith(color: CustomColors.kMove[4]),
        ),
        const SizedBox(height: 8.0),

         Text(
          trip.meetPoint,
          style: Styles.textStyle13W400,
        )
      ],
    );
  }
}
