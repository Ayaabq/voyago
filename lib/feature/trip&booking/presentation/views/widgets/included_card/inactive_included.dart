import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/icons_text.dart';

class InActiveIncluded extends StatelessWidget {
  const InActiveIncluded({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return IconsText(
      text: title,
      icon: Iconsax.close_circle,
      colorIcon: CustomColors.kGrey[1],
      sizeIcon: 25,
      style: Styles.textStyle13W400.copyWith(color: CustomColors.kGrey[1]),
    );
  }
}
