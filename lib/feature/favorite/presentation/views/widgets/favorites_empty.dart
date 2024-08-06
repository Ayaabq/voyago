import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Wallet.favoritesEmpty,
          height: 175,
          width: 235,
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "You have no favorites yet!!".tr(),
            style: Theme.of(context).brightness == Brightness.dark
                ? Styles.textStyle20W600dark
                : Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
