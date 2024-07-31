import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/feature/wallet/presentation/views/detiles_wallet_history.dart';

import '../../../../profile/presentation/views/widgets/appbar_profile.dart';

class DetilesWalletHestoryBody extends StatelessWidget {
  const DetilesWalletHestoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ProfileAppBar(
            titel: "History Wallet".tr(),
          ),
          const SizedBox(height: 10),
          const CardTransactionDetails(),
          const SizedBox(height: 6)
        ],
      ),
    );
  }
}
