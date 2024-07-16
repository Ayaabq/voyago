import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class DaysAndPriceWidget extends StatelessWidget {
  final int days;
  final double fromPrice;

  const DaysAndPriceWidget({
    super.key,
    required this.days,
    required this.fromPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$days Days",
          style: Styles.textStyle12W400
        ),
        const Spacer(),
        // Spacing between the text and the container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: CustomColors.kGrey[0], // Background color of the container
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "form $fromPrice\$",
            style: Styles.textStyle10W400
          ),
        ),
      ],
    );
  }
}
