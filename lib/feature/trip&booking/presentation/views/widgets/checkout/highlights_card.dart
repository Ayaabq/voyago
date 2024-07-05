
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../over_view_card/icon_text_view.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({super.key});

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
              title: '2 Adults, 1 Child',
              iconColor: CustomColors.kMove[5],
            ),
            IconText(
                icon: Iconsax.calendar_tick,
                title: 'Wed, October 8, 2024',
                iconColor: CustomColors.kMove[5]),
            IconText(
                icon: Iconsax.clock,
                title: '09:00 AM',
                iconColor: CustomColors.kMove[5]),
          ],
        ),
      ],
    );
  }
}
