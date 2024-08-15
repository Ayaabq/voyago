import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../presentation/manger/detiles_wallet/cubit/detiles_wallet_state.dart';
import '../../presentation/manger/fill_wallet/cubit/fill_wallet_state.dart';
import '../../presentation/manger/history_wallet/cubit/history_wallet_state.dart';
import '../../presentation/manger/wallet/cubit/wallet_state.dart';
import '../models/fill_wallet_models.dart';



abstract class WalletRepo {
Future<Either<Failure,WalletSuccess>> getWallet();
Future<Either<Failure,WalletHistorySuccess>> getWalletHistory();
Future<Either<Failure,TransactionSuccess>> getTransaction(String url);
Future<Either<Failure,FillWalletSuccess>> postFillWallet(FillWalletRequestModel requestModel );
}
