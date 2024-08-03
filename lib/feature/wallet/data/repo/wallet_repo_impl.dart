import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo.dart';
import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_state.dart';

import '../../../../core/utils/confg.dart';

class WalletRepoImpl implements WalletRepo {
  final ApiServices api;

  WalletRepoImpl(this.api);

 
  @override
  Future<Either<Failure, WalletSuccess>> getWallet() async {
    try {
      var response = await api.get(Confg.wallet, hasToken: true);
      return right(WalletSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
