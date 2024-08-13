import 'package:equatable/equatable.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

import '../../../../data/models/history_wallet.dart';

abstract class WalletHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletHistoryInitial extends WalletHistoryState {}

class WalletHistoryLoading extends WalletHistoryState {}

class WalletHistorySuccess extends WalletHistoryState {
  final List<HistoryWalletModel> walletHistoryModel;

  WalletHistorySuccess(this.walletHistoryModel);
  @override
  List<Object?> get props => [walletHistoryModel];
  static WalletHistorySuccess fromJson(Map<String, dynamic> response) {
    final historyWallet = (response['data'] as List)
    .map((e) => HistoryWalletModel.fromJson(e))
    .toList();
    return WalletHistorySuccess(historyWallet);
  }
}

class WalletHistoryFailure extends WalletHistoryState {
  final String errorMessage;
  WalletHistoryFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static WalletHistoryFailure fromJson(Map<String, dynamic> response) {
    return WalletHistoryFailure(response['err'] ?? 'Unknown error');
  }
}
