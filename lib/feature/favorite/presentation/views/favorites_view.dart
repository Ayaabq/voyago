import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../books/presentation/views/books_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesBody();
  }
}

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabs:  [
        Tab(
          text: "Destinations".tr(),
        ),
        Tab(
          text: "Attractions".tr(),
        ),
        Tab(
          text: "Trips".tr(),
        ),
      ],
      titel: "My favorites".tr(),
      tabViews:  [
        const FavoritesEmpty(),
        Text("My favorites".tr(),),
        Text("My favorites".tr(),)
      ],
    );
  }
}

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
            style: Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
