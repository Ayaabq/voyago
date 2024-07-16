import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../utils/styles.dart';

class DialogCustom extends StatelessWidget {
  const DialogCustom(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.subtitel});
  final String title;
  final String imagePath;
  final String subtitel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.kWhite[0],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              imagePath,
              width: 230,
              height: 185,
            ),
          ),
          const SizedBox(height: 16),
          Text(title,
              style: Styles.textStyle20W700.copyWith(
                  fontWeight: FontWeight.w600, color: CustomColors.kMove[9])),
          const SizedBox(height: 10),
          Text(subtitel,
              style:
                  Styles.textStyle13W400.copyWith(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
