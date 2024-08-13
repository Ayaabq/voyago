import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/wallet/data/models/history_wallet.dart';
import 'package:voyago/feature/wallet/presentation/manger/history_wallet/cubit/history_wallet_cubit.dart';
import 'package:voyago/feature/wallet/presentation/manger/history_wallet/cubit/history_wallet_state.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';

class HistoryWalletBody extends StatelessWidget {
  const HistoryWalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileAppBar(
            titel: 'History Wallet',
          ),
          //  const SizedBox(height: 50),
          ListHistoryWallet()
        ],
      ),
    );
  }
}

class ListHistoryWallet extends StatelessWidget {
  ListHistoryWallet({
    super.key,
    this.model,
  });
  List<HistoryWalletModel>? model;
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      context.read<HistoryWalletCubit>().fetchHistoryWallet();
      return BlocBuilder<HistoryWalletCubit, WalletHistoryState>(
        builder: (context, state) {
          if (state is WalletHistorySuccess) {
            List<HistoryWalletModel> model = state.walletHistoryModel;
            return Expanded(
              child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryCardWallet(
                      model: model[index],
                    );
                  }),
            );
          } else if (state is WalletHistoryLoading) {
            return const CircularProgressIndicator();
          } else if (state is WalletHistoryFailure) {
            return const Center(
                child: Text(
              "falier",
              style: TextStyle(color: Colors.white),
            ));
          }
          return const Text(
            "errrror",
            style: TextStyle(color: Colors.white),
          );
        },
      );
    }
    return const Text("data");
  }
}

class HistoryCardWallet extends StatelessWidget {
  const HistoryCardWallet({
    super.key,
    required this.model,
  });
  final HistoryWalletModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kDetilesWaletHistoryView, extra: model);
        print(model);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateRow(
                  date: model.date.toUtc().toString(),
                ),
                const SizedBox(height: 16),
                TransactionDetail(
                    title: "Added amount:".tr(),
                    value: model.amount.toString()),
                const SizedBox(height: 16),
                TransactionDetail(title: "Stutas:", value: model.status),
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
  // final HistoryWalletModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Date:".tr(),
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
        Text("Deposit picture:".tr(), style: Styles.textStyle14W400),
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
