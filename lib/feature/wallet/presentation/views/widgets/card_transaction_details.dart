import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/date_time_helper.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../data/models/ditels_histroy_wallet.dart';
import 'history_wallet_body.dart';

class CardTransactionDetails extends StatelessWidget {
  const CardTransactionDetails({
    super.key,
    required this.model,
  });
  final Transaction model;
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
                child: DateRow(
                    date: DateTimeHelper.formatDateMMMDY(
                        DateTime.parse(model.date.toString())))),
            // const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TransactionDetail(
                  //     title: "Transaction id:".tr(), value: '#0235326'),
                  //  Divider(color: CustomColors.kGrey[0]),
                  TransactionDetail(
                      title: "Old balance:".tr(),
                      value: model.lastBalance.toString()),
                  Divider(color: CustomColors.kGrey[0]),
                  TransactionDetail(
                      title: "Added amount:".tr(),
                      value: model.amount.toString()),
                  Divider(color: CustomColors.kGrey[0]),
                  TransactionDetail(
                      title: "New balance:".tr(),
                      value: model.newBalance.toString()),
                  Divider(color: CustomColors.kGrey[0]),
                  TransactionDetail(title: "Status:".tr(), value: model.status),
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
