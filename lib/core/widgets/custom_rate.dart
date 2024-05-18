import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/styles.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, required this.rate});
final double rate;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [  const Icon(
        size: 14,
        FontAwesomeIcons.solidStar,
        color: Color(0xffFFDD4F),
      ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rate.toString(),
          style: Styles.textStyle13W400,
        ),],
    );
  }
}
