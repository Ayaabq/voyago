import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_rate.dart';
import '../../../../../../core/widgets/location_with_country.dart';

class TexColumn extends StatelessWidget {
  const TexColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 380;
          final padding = 10.0;
          final textSizeTitle = isSmallScreen ? 16.0 : 20.0;
          final textSizeReview = isSmallScreen ? 11.0 : 13.0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Berlin: 3-Hours City Tour by Boat",
                style: TextStyle(
                  fontSize: textSizeTitle,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6),
              Row(
                // alignment: WrapAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  LocationWithCountry(country: "Berlin, Germany"),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                      ),
                      child: LocationWithCountry(country: "View on Map"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // alignment: WrapAlignment.spaceBetween,
                children: [
                  CustomRating(rate: 4.8),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      "113 reviews",
                      style: TextStyle(
                        fontSize: textSizeReview,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    )
    ;
  }
}
