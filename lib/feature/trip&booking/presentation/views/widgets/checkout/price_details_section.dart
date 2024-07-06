import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/price_details_item.dart';
import '../../../../../../core/widgets/text_cost_details_item.dart';

class PriceDetailsSection extends StatelessWidget {
  const PriceDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.kGrey[0]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            'Price details',
            style: Styles.textStyle16W700,
          ),
          const SizedBox(height: 16.0),
          const PriceDetailItem(
              title: 'Travelers',
              details: TextCostDetail(child: 2, adult: 10, childPrice: 20, adultPrice: 25)
          ),
          Divider(
            color: CustomColors.kBlack[1],
            endIndent: 20,
            indent: 20,
          ),
          const Text(
            'Optional choices',
            style:Styles.textStyle16W700,
          ),
          const SizedBox(height: 16.0),

          const PriceDetailItem(
              title: 'restaurant',
              details: TextCostDetail(child: 2, adult: 10, childPrice: 20, adultPrice: 25)

          ),
          const SizedBox(height: 16.0),
          Divider(
            color: CustomColors.kBlack[1],
            endIndent: 20,
            indent: 20,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '\$260',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.kHighlightMove,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
