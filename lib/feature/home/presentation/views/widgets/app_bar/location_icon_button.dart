import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_colors.dart';

class LocationIconButton extends StatelessWidget {
  const LocationIconButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.location_on,
        size: 30,
        color: CustomColors.kWhite[0],
      ),
    );
  }
}
