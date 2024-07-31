import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/feature/wallet/presentation/views/widgets/detiles_wallet_history_body.dart';

import 'widgets/history_wallet_body.dart';

class DetilesWaletHistoryView extends StatelessWidget {
  const DetilesWaletHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetilesWalletHestoryBody();
  }
}

class CardTransactionDetails extends StatelessWidget {
  const CardTransactionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.kMove[3]
                        : CustomColors.kMove[1],
                    borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(16),
                        topStart: Radius.circular(16))),
                child: const DateRow(date: "Feb 03,2023")),
            // const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TransactionDetail(
                      title: 'Transaction id:', value: '#0235326'),
                  Divider(color: CustomColors.kGrey[0]),
                  const TransactionDetail(
                      title: 'Old balance:', value: '\$2,500'),
                  Divider(color: CustomColors.kGrey[0]),
                  const TransactionDetail(
                      title: 'Added amount:', value: '\$1,100'),
                  Divider(color: CustomColors.kGrey[0]),
                  const TransactionDetail(
                      title: 'New balance:', value: '\$3,600'),
                  Divider(color: CustomColors.kGrey[0]),
                  const DepositPicture(),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
