import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../presentation/manger/wallet/cubit/wallet_state.dart';



abstract class WalletRepo {
Future<Either<Failure,WalletSuccess>> getWallet();
}
