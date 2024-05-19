import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class StateTrips extends StatelessWidget {
  const StateTrips({super.key, required this.state});

  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: CustomColors.kMove[3],
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(state,
          style: Styles.textStyle10W400.copyWith(
              fontWeight: FontWeight.w500, color: CustomColors.kWhite[0])),
    );
  }
}
