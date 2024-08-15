import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class FillCard extends StatelessWidget {
  const FillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(
            child: Image.asset(
              Wallet.fillWalletImage,
              width: 125,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
