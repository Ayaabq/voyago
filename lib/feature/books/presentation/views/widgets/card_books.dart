import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/books/data/models/books_model.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

class CardBooks extends StatelessWidget {
  const CardBooks({super.key, required this.paymentState, required this.tripData});
  final String paymentState;

  final TripData tripData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            HomeAssets.dummyOffers, // replace with your image asset path
            height: 170,
            width: ScreenSizeUtil.dynamicWidth(.30),
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
                icon: Iconsax.location,
                title: tripData.trip.name,
                iconColor: CustomColors.kMove[5]),
            IconText(
                icon: Iconsax.calendar_tick,
                title: tripData.trip.startDate,
                iconColor: CustomColors.kMove[5]),
            IconText(
              icon: Iconsax.user,
              title: tripData.adult.toString() + tripData.child.toString(),
              iconColor: CustomColors.kMove[5],
            ),
            IconText(
                icon: Iconsax.wallet,
                title: 'Payment status:',
                iconColor: CustomColors.kMove[5]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: CustomColors.kMove[5],
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                paymentState,
                style: Styles.textStyle14W600
                    .copyWith(color: CustomColors.kWhite[0]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
