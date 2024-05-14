import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class PriceDisplay extends StatelessWidget {
  final String oldPrice;
  final String newPrice;
  final int ratio;
  const PriceDisplay({
    super.key,
    required this.oldPrice,
    required this.newPrice, required this.ratio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          oldPrice,
          style: Styles.textStyle10W400.copyWith(
            decoration: TextDecoration.lineThrough,

          ),
        ),
        const SizedBox(width: 8),
        Text(
          newPrice,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: CustomColors.kHighlightMove

          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("- $ratio %",
            style: Styles.textStyle10W400.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomColors.kWhite[0]
            ),),
          ),
        )
      ],
    );
  }
}
