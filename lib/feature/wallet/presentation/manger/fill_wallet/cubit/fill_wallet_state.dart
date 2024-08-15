abstract class FillWalletState {}

class FillWalletInitial extends FillWalletState {}

class FillWalletLoading extends FillWalletState {}



class FillWalletSuccess extends FillWalletState {
  final String message;
  

  FillWalletSuccess(this.message);

  static FillWalletSuccess fromJson(Map<String, dynamic> response) {
    return FillWalletSuccess(response['message']);
  }
}


class FillWalletFailure extends FillWalletState {
  final String errorMessage;
  FillWalletFailure(this.errorMessage);

static FillWalletFailure fromJson(Map<String, dynamic> response) {
    return FillWalletFailure(response['err'],);
  }
}
