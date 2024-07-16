import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/days_and_price.dart';
import 'package:voyago/core/widgets/icons_text.dart';

import '../../../../../../../core/utils/screen_size_util.dart';

class TripOfferColumn extends StatelessWidget {
  const TripOfferColumn({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Column(
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
                  Text(
                    "Rome Trip",
                    style: Styles.textStyle14W600
                        .copyWith(color: CustomColors.kBlack[0]),
                  ),
                  const Spacer(),
                ],
              ),
              IconsText(
                  text: "Italy",
                  style: Styles.textStyle12W400
                      .copyWith(color: CustomColors.kGrey[2]),
                  icon: Icons.location_on,
                  colorIcon: CustomColors.kGrey[2],
                  sizeIcon: 14),
              const DaysAndPriceWidget(days: 5, fromPrice: 70)
            ],
          ),
        )
      ],
    );
  }
}
