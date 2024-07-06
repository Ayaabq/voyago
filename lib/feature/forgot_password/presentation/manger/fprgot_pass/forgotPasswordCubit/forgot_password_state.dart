part of 'forgot_password_cubit.dart';


abstract class ForgotPasswordState {
  
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;
  

  ForgotPasswordSuccess(this.message );

  static ForgotPasswordSuccess fromJson(Map<String, dynamic> response) {
    return ForgotPasswordSuccess(response['msg']);
  }
}


class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;
 ForgotPasswordFailure(this.errorMessage);

static ForgotPasswordFailure fromJson(Map<String, dynamic> response) {
    return ForgotPasswordFailure(response['err'],);
  }
}

