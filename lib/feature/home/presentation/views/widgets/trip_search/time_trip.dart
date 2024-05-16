// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class TimeTrip extends StatelessWidget {
  final String day;

  const TimeTrip({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.timer,
          color: CustomColors.kWhite[0],
          size: 10,
        ),
        const SizedBox(width: 2),
        Text(
          "$day day",
          style: Styles.textStyle10W400.copyWith(
              fontWeight: FontWeight.w600, color: CustomColors.kWhite[0]),
        ),
      ],
    );
  }
}
