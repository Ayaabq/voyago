import 'package:bloc/bloc.dart';
import 'package:voyago/feature/wallet/presentation/manger/detiles_wallet/cubit/detiles_wallet_state.dart';

import '../../../../data/repo/wallet_repo.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final WalletRepo repoWallet;

  TransactionCubit( this.repoWallet) : super(TransactionInitial());

  Future<void> fetchDetilsWallet(String url) async {

    emit(TransactionLoading());
//String url = "/profile/wallet_history/${id.toString()}";
    var result = await repoWallet.getTransaction(url);
    result.fold(
          (failure)
      {

        emit( TransactionFailure(failure.errMessage));
        
      },
          (success) async {
        emit(TransactionSuccess(success.transactionModel));

      },
    );
  }


}
