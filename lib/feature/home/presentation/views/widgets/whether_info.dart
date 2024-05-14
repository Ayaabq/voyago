import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class WhetherInfo extends StatelessWidget {
  const WhetherInfo({super.key, required this.degree, required this.country});
  final int degree;
  final String country;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text("$degree℃  ",

        style: Styles.textStyle32W700.copyWith(
            color: CustomColors.kWhite[0]
        ),
        ),
        Text(country,
        style: Styles.textStyle20W700.copyWith(
          color: CustomColors.kWhite[0]
        ),)
      ],
    );
  }
}
