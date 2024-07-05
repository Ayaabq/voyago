import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/count_widget.dart';

import '../../../../../../core/utils/styles.dart';

class TravelerNumber extends StatelessWidget {
  const TravelerNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'You can select up to 15 travelers in total.',
          style: Styles.textStyle13W400,
        ),
        SizedBox(height: 12.0),
        ItemCountWidget(
          title: 'Adult (age 18-95)',
          initialCount: 2,
        ),
        SizedBox(height: 12.0),
        ItemCountWidget(
          title: 'Child (age 5 - 17)',
          initialCount: 1,
        ),
        // Add your optional choices widgets here
      ],
    );
  }
}

