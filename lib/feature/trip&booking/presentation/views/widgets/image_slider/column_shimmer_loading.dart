import 'package:flutter/material.dart';

import '../../../../../../core/widgets/location_with_country.dart';

class ColumnShimmerLoading extends StatelessWidget {
  const ColumnShimmerLoading({super.key, required this.padding});
  final double padding;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: 270,
          padding: EdgeInsets.symmetric(
              horizontal: padding, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          // alignment: WrapAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              height: 20,
              width: 100,
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300],
              ),),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: padding, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
                child:
                const LocationWithCountry(country: "View on Map"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // alignment: WrapAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: 70,
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: padding, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 20,
              width: 70,
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: padding, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
