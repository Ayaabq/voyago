abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {
  final int balance;

  WalletSuccess(this.balance);

  static WalletSuccess fromJson(Map<String, dynamic> response) {
    return WalletSuccess((response['data']['balance']));
  }
}

class WalletFailure extends WalletState {
  final String errorMessage;

  WalletFailure(this.errorMessage);

  static WalletFailure fromJson(Map<String, dynamic> response) {
    return WalletFailure(response['msg']);
  }
}
