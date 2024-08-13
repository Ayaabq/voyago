import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/feature/wallet/presentation/views/detiles_wallet_history.dart';

import '../../../../profile/presentation/views/widgets/appbar_profile.dart';
import '../../../data/models/ditels_histroy_wallet.dart';
import 'card_transaction_details.dart';

class DetilesWalletHestoryBody extends StatelessWidget {
  const DetilesWalletHestoryBody({super.key, required this.model});

  final Transaction model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(
            titel: "History Wallet".tr(),
          ),
          const SizedBox(height: 10),
           CardTransactionDetails(
            model:model,
          ),
          const SizedBox(height: 6)
        ],
      ),
    );
  }
}
