import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/icons_text.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/included_column.dart';

import '../../../../../../core/utils/styles.dart';

class IncludedCard extends StatelessWidget {
  const IncludedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,
              vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What's Included",
                style: Styles.textStyle20W700,),
              IncludedColumn(airCondition: true, tourGuide: false, breakfast: true, wifi: true, lanch: false)

            ],
          ),
        ),
      ),
    );
  }
}
