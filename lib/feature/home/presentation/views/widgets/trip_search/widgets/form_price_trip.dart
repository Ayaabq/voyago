import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class FormPrice extends StatelessWidget {
  const FormPrice({
    super.key,
    required this.fromPrice,
  });

  final String fromPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CustomColors.kWhite[2], // Background color of the container
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text("${"Form".tr()} $fromPrice\$",
          style: Styles.textStyle10W400.copyWith(
              color: CustomColors.kMove[9], fontWeight: FontWeight.w600)),
    );
  }
}
