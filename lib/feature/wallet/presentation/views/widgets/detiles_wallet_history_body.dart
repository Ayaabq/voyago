import 'package:flutter/material.dart';
import 'package:voyago/feature/wallet/presentation/views/detiles_wallet_history.dart';

import '../../../../profile/presentation/views/widgets/appbar_profile.dart';

class DetilesWalletHestoryBody extends StatelessWidget {
  const DetilesWalletHestoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(children: [
      ProfileAppBar(
        titel: 'History Wallet',
      ),
      SizedBox(height: 10),
      CardTransactionDetails(),
      SizedBox(height: 6)
    ]));
  }
}
