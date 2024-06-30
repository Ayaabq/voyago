import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/custom_colors.dart';

class LocationIconButton extends StatelessWidget {
  const LocationIconButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Iconsax.location,
        size: 40,
        color: CustomColors.kWhite[0],
      ),
    );
  }
}
