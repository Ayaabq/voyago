import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../generated/assets.dart';

class ProfilePictureEdit extends StatelessWidget {
  const ProfilePictureEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: CustomColors.kMove[5],
          radius: 63,
          child: const CircleAvatar(
              radius: 60, backgroundImage: AssetImage(Assets.homeDummyOffer)
              //'https://via.placeholder.com/150'
              ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: CircleAvatar(
            backgroundColor: CustomColors.kMove[6],
            radius: 16,
            child: Icon(
              Iconsax.edit,
              color: CustomColors.kWhite[0],
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
