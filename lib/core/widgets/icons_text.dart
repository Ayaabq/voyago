import 'package:flutter/material.dart';


class IconsText extends StatelessWidget {
  const IconsText(
      {super.key,
      required this.text,
      required this.icon,
      required this.colorIcon,
      required this.sizeIcon,
      required this.style });
  final String text;
  final IconData icon;
  final Color colorIcon;
  final double sizeIcon;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: sizeIcon,
          color: colorIcon,
        ),
       
        const SizedBox(width: 4),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
