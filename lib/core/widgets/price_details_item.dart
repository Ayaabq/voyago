import 'package:flutter/material.dart';

import '../utils/styles.dart';

class PriceDetailItem extends StatelessWidget {
  final String title;
  final Widget details;

  const PriceDetailItem({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(

          child: Text(
            title,
            style:Styles.textStyle16W400,
            overflow: TextOverflow.clip,
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(child: details)
      ],
    );
  }
}
