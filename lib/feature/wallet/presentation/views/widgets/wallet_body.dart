import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_cubit.dart';
import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_state.dart';

import '../../../../profile/presentation/manager/currency_cubit/currency_cubit.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(children: [
        ProfileAppBar(
          titel: "Wallet".tr(),
        ),
        const SizedBox(height: 50),
        const Padding(
          padding: kPaddingHoriz24,
          child: BalanceCard(),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: kPaddingHoriz24,
          child: ButtonAuth(
              title: "Fill in my wallet".tr(),
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.kFillWalletView);
              }),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: kPaddingHoriz24,
          child: ButtonAuth(
              title: "Wallet history".tr(),
              onTap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.kHistoryWalletView);
              }),
        ),
      ]),
    );
  }
}

class BalanceCard extends StatelessWidget {
  // final double balance;

  const BalanceCard({
    super.key,
    // required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final exchanger = context.read<CurrencyCubit>().exchanger;
    String currency = context.read<CurrencyCubit>().selectedCurrency;
    if (currency == "USD") {
      currency = '\$';
    } else if (currency == "EUR") currency = '€';

    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletSuccess) {
          return Card(
            color: Theme.of(context).cardColor,
            //const Color(0xff3E3E3E),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(
                      Wallet.walletImage,
                      width: 125,
                      height: 90,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balance".tr(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '$currency ${(state.balance * exchanger).toStringAsFixed(1)}',
                        style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is WalletFailure) {
          return Text(state.errorMessage);
        } else if (state is WalletLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("opss"));
        }
      },
    );
  }
}
