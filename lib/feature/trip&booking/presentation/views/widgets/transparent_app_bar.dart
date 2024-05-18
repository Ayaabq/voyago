import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: CustomColors.kMove[4],
          ),
        ),
        onPressed: () {
          // Handle the leading icon button press
        },
      ),
      actions: [
        IconButton(
          icon:  Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Iconsax.share,
              color: CustomColors.kMove[4],
            ),
          ),
          onPressed: () {
            // Handle the share button press
          },
        ),
        IconButton(
          icon: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Iconsax.heart,
              color: CustomColors.kMove[4],
            ),
          ),
          onPressed: () {
            // Handle the favorite button press
          },
        ),
      ],
    );
  }
}
