import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo.dart';
import 'package:voyago/feature/wallet/presentation/manger/detiles_wallet/cubit/detiles_wallet_state.dart';
import 'package:voyago/feature/wallet/presentation/manger/fill_wallet/cubit/fill_wallet_state.dart';
import 'package:voyago/feature/wallet/presentation/manger/history_wallet/cubit/history_wallet_state.dart';
import 'package:voyago/feature/wallet/presentation/manger/wallet/cubit/wallet_state.dart';

import '../../../../core/utils/confg.dart';
import '../models/ditels_histroy_wallet.dart';
import '../models/fill_wallet_models.dart';

class WalletRepoImpl implements WalletRepo {
  final ApiServices api;

  WalletRepoImpl(this.api);

 //********       wallet                    ******** */
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


///*******       history      wallet                         ******** */
  @override
  Future<Either<Failure, WalletHistorySuccess>> getWalletHistory() async{
   

    try {
      var response = await api.get(Confg.historyWallet, hasToken: true);
      return right(WalletHistorySuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }



///*********         Transaction               ****** */
  @override
  Future<Either<Failure, TransactionSuccess>> getTransaction(String url) async{
    try {
      var response = await api.get(url, hasToken: true);
      return right(TransactionSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
 Future<Either<Failure, FillWalletSuccess>> postFillWallet(FillWalletRequestModel requestModel) async {
    try {
      FormData formData = await requestModel.toFormData();
      var response = await api.post(Confg.chargeWallet, formData: formData, hasToken: true);
      return right(FillWalletSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  }





