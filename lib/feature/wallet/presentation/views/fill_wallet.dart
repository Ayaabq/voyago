import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/wallet/presentation/views/widgets/fill_wallet_body.dart';

import '../../../../core/utils/services_locater.dart';
import '../../data/repo/wallet_repo_impl.dart';
import '../manger/fill_wallet/cubit/fill_wallet_cubit.dart';

class FillWalletView extends StatelessWidget {
  const FillWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FillWalletCubit(getIt.get<WalletRepoImpl>()),
      child: const FillWalletBody(),
    );
  }
}
