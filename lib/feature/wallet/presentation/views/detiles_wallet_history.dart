// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:voyago/core/utils/custom_colors.dart';
// import 'package:voyago/feature/wallet/presentation/views/widgets/detiles_wallet_history_body.dart';

// import '../../data/models/ditels_histroy_wallet.dart';
// import 'widgets/history_wallet_body.dart';

// class DetilesWaletHistoryView extends StatelessWidget {
//   const DetilesWaletHistoryView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DetilesWalletHestoryBody(

//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/wallet/data/models/history_wallet.dart';
import 'package:voyago/feature/wallet/presentation/manger/detiles_wallet/cubit/detiles_wallet_state.dart';

import '../manger/detiles_wallet/cubit/detiles_wallet_cubit.dart';
import 'widgets/detiles_wallet_history_body.dart';

class DetilesWaletHistoryView extends StatelessWidget {
  const DetilesWaletHistoryView({super.key, required this.id});
  final HistoryWalletModel id;
  @override
  Widget build(BuildContext context) {
   
    context
        .read<TransactionCubit>()
        .fetchDetilsWallet(Confg.historyWalletId + id.id.toString());

    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionSuccess) {
            return DetilesWalletHestoryBody(model: state.transactionModel);
          } else if (state is TransactionFailure) {
            return Center(
              child: Text(
                  'Failed to load transaction details: ${state.errorMessage}'),
            );
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
