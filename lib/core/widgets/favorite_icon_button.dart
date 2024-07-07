import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, this.isFavorite=false, this.onPressed});
 final bool isFavorite;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25, // Adjust the width and height to your needs
      height: 25,
      decoration: BoxDecoration(
        color: CustomColors.kWhite[0], // Background color
        shape: BoxShape.circle, // Makes the container circular
      ),
      child: Center(
        child: IconButton(
          icon:  Icon(isFavorite!?Iconsax.heart5:Iconsax.heart,
          size: 18,),
          color: CustomColors.kHighlightMove  , // Icon color
          onPressed: onPressed??() {
            // Your onPressed code here
            print('Icon Button Pressed');
          },
            padding: const EdgeInsets.all(0), // Remove default padding
            constraints: const BoxConstraints()
        ),
      ),
    );
  }
}
