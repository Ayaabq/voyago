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
      tabs: const [
        Tab(
          text: "Destinations",
        ),
        Tab(
          text: "Attractions",
        ),
        Tab(
          text: "Trips ",
        ),
      ],
      titel: 'My favorites',
      tabViews: const [
        FavoritesEmpty(),
        Text("My favorites"),
        Text("My favorites"),
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
            "You have no favorites yet!!",
            style: Styles.textStyle30W600.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
