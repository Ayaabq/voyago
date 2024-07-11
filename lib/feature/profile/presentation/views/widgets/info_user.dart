import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';

class InformationRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InformationRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: CustomColors.kMove[5]),
              const SizedBox(width: 10),
              Text(
                label,
                style: Styles.textStyle16W700.copyWith(
                    fontWeight: FontWeight.w600, color: CustomColors.kBlack[1]),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(value, style: Styles.textStyle16W400),
          ),
        ],
      ),
    );
  }
}

/* /**/ 

import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';
*/
