import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/styles.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';

class HistoryWalletBody extends StatelessWidget {
  const HistoryWalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const ProfileAppBar(
        titel: 'History Wallet',
      ),
      //  const SizedBox(height: 50),
      Expanded(
          child: ListView(
        children: const [
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet(),
          SizedBox(height: 6),
          HistoryCardWallet()
        ],
      ))
    ]));
  }
}

class HistoryCardWallet extends StatelessWidget {
  const HistoryCardWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetilesWaletHistoryView);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateRow(
                  date: 'feb 03, 2024',
                ),
                SizedBox(height: 16),
                TransactionDetail(title: 'Added amount:', value: '\$1,100'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateRow extends StatelessWidget {
  const DateRow({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Date:',
          style: Styles.textStyle14W400,
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: Styles.textStyle16W400.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class TransactionDetail extends StatelessWidget {
  final String title;
  final String value;

  const TransactionDetail({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle14W400,
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: Styles.textStyle16W400.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class DepositPicture extends StatelessWidget {
  const DepositPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Deposit picture:', style: Styles.textStyle14W400),
        const SizedBox(height: 10),
        Center(
          child: Image.asset(
            Wallet.bankImage,
            height: 400,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
