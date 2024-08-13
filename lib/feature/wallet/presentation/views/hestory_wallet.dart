import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo_impl.dart';
import 'package:voyago/feature/wallet/presentation/manger/history_wallet/cubit/history_wallet_cubit.dart';
import 'package:voyago/feature/wallet/presentation/views/widgets/history_wallet_body.dart';

import '../../../../core/utils/services_locater.dart';

class HistoryWalletView extends StatelessWidget {
  const HistoryWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HistoryWalletCubit(getIt.get<WalletRepoImpl>())..fetchHistoryWallet(),
      child: const HistoryWalletBody(),
    );
  }
}
