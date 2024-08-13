import 'package:bloc/bloc.dart';
import 'package:voyago/feature/wallet/presentation/manger/history_wallet/cubit/history_wallet_state.dart';

import '../../../../data/repo/wallet_repo.dart';

class HistoryWalletCubit extends Cubit<WalletHistoryState> {
  final WalletRepo repoWallet;

  HistoryWalletCubit( this.repoWallet) : super(WalletHistoryInitial());

  Future<void> fetchHistoryWallet() async {

    emit(WalletHistoryLoading());

    var result = await repoWallet.getWalletHistory();
    result.fold(
          (failure)
      {

        emit( WalletHistoryFailure(failure.errMessage));
        // emit(AttractionInitial());
      },
          (success) async {
        emit(WalletHistorySuccess(success.walletHistoryModel));

      },
    );
  }


}
