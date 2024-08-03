import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo_impl.dart';
import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_cubit.dart';
import 'package:voyago/feature/wallet/presentation/views/widgets/wallet_body.dart';

import '../../../../core/utils/services_locater.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(getIt.get<WalletRepoImpl>())..fetchWallet(),
      child: const WalletBody(),
    );
  }
}
