import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/highlights_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/notes_card.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../over_view_card/icon_text_view.dart';

class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Berlin: 3-Hours City Tour by Boat',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16.0),
        const HighlightCard(),
        const SizedBox(height: 12.0),
        IconText(
          isLast: true,
          icon: Iconsax.location,
          title: 'Meeting Point:',
          iconColor: CustomColors.kMove[5],
          textStyle:
              Styles.textStyle16W700.copyWith(color: CustomColors.kMove[4]),
        ),
        const SizedBox(height: 8.0),

        const Text(
          "Meeting Point: Stern und Kreisschiffahrt, Berlin, Germany",
          style: Styles.textStyle13W400,
        )
      ],
    );
  }
}
