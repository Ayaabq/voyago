import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class LocationWithCountry extends StatelessWidget {
  final String country;

  const LocationWithCountry({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: CustomColors.kGrey[2],
          size: 10,
        ),
        const SizedBox(width: 2),
        Text(
          country,
          style: Styles.textStyle13W400,
        ),
      ],
    );
  }
}