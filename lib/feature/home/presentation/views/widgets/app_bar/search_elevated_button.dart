import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/custom_colors.dart';

class SearchElevatedButton extends StatelessWidget {
  const SearchElevatedButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 38,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff595959)
                : CustomColors.kWhite[3],
          ),
          onPressed: onTap,
          child:  Row(
            children: [
              const Icon(
                Iconsax.search_normal,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Where to go?".tr(),
                style: Styles.textStyle16W400,
              ),
            ],
          )),
    ));
  }
}
