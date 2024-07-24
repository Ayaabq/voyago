import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';

class RatingColumn extends StatelessWidget {
  const RatingColumn({super.key, required this.rate, required this.total});
  final double rate;
  final int total;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            CustomRating(rate: rate,fontStyle: Styles.textStyle32W700,
              iconSize: 30,
            ),

          ],
        ),
        const SizedBox(height: 8),
         Text(
          '$total Reviews',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
