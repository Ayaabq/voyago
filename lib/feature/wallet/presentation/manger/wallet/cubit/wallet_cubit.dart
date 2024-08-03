import 'package:bloc/bloc.dart';

import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_state.dart';

import '../../../../data/repo/wallet_repo.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepo walletRepo;

  WalletCubit(this.walletRepo) : super(WalletInitial());

  Future<void> fetchWallet() async {
    emit(WalletLoading());

    var result = await walletRepo.getWallet();
    result.fold(
      (failure) {
        emit(WalletFailure(failure.errMessage));
      },
      (wallet) {
        emit(WalletSuccess(wallet.balance));
      },
    );
  }
}
