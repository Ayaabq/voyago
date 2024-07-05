abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final String message;

  VerificationSuccess(this.message);

  static VerificationSuccess fromJson(Map<String, dynamic> response) {
    return VerificationSuccess(response['msg']);
  }
}

class VerificationFailure extends VerificationState {
  final String errorMessage;

  VerificationFailure(this.errorMessage);

  static VerificationFailure fromJson(Map<String, dynamic> response) {
    return VerificationFailure(response['err']);
  }
}
