import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class IconsText extends StatelessWidget {
  const IconsText(
      {super.key,
      required this.text,
      required this.icon,
      required this.colorIcon,
      required this.sizeIcon,
      this.style});
  final String text;
  final IconData icon;
  final Color colorIcon;
  final double sizeIcon;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: sizeIcon,
          color: colorIcon,
        ),
        // Icon(
        //   Icons.location_on,
        //   color: CustomColors.kGrey[2],
        //   size: 10,
        // ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Styles.textStyle10W600,
        ),
      ],
    );
  }
}
