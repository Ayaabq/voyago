import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo.dart';
import 'package:voyago/feature/wallet/presentation/manger/fill_wallet/cubit/fill_wallet_state.dart';

import '../../../../data/models/fill_wallet_models.dart';

class FillWalletCubit extends Cubit<FillWalletState> {
  final WalletRepo walletRepo;

  FillWalletCubit(this.walletRepo) : super(FillWalletInitial());

  Future<void> fillWallet(FillWalletRequestModel requestModel) async {
    emit(FillWalletLoading());
    final result = await walletRepo.postFillWallet(requestModel);
    result.fold(
      (failure) => emit(FillWalletFailure(failure.errMessage)),
      (success) => emit(FillWalletSuccess(success.message)),
    );
  }
}
                  