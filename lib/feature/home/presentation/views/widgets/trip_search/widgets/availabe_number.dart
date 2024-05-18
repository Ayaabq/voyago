import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class AvailableNumber extends StatelessWidget {
  const AvailableNumber({
    super.key, required this.availableNubmer,
  });
  final String availableNubmer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: CustomColors.kWhite[3],
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(availableNubmer,
          style: Styles.textStyle10W400.copyWith(
              fontWeight: FontWeight.w500, color: CustomColors.kGrey[3])),
    );
  }
}
