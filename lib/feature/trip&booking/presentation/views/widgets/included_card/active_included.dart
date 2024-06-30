import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/icons_text.dart';

class ActiveIncluded extends StatelessWidget {
  const ActiveIncluded({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return IconsText(
      text: title,
      icon: Iconsax.tick_circle,
      colorIcon: CustomColors.kBlack[3],
      sizeIcon: 25,
      style: Styles.textStyle14W400.copyWith(color: CustomColors.kBlack[3]),
    );
  }
}
