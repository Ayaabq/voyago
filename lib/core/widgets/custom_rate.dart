import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/styles.dart';

class CustomRating extends StatelessWidget {
  const CustomRating(
      {super.key, required this.rate, this.iconSize, this.fontStyle});
  final double rate;
  final double? iconSize;
  final TextStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          size: iconSize ?? 14,
          FontAwesomeIcons.solidStar,
          color: const Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rate.toString(),
          style: Theme.of(context).brightness == Brightness.dark
              ? Styles.textStyle13W400dark
              : Styles.textStyle13W400,
        ),
      ],
    );
  }
}
